// Library libraries
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hackathon_boilerplate/screens/post/post.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:share/share.dart';
import 'dart:convert';

// Internal libraries
import 'package:hackathon_boilerplate/widgets/app_button/index.dart';
import 'package:hackathon_boilerplate/widgets/bottom_nav_bar/index.dart';
import 'package:hackathon_boilerplate/serializers/news.dart';
import 'package:hackathon_boilerplate/serializers/MockPost/mock_post.dart';
import 'package:hackathon_boilerplate/serializers/MockUser/mock_user.dart';
import '../postAdd/post_add.dart';

// Internal data stores
import '../../data/counter.dart';
import '../../data/User/user.dart';
import '../../data/Post/post.dart';
import '../../data/HackerNews/hacker_news.dart';

final counter = Counter();

class LinkPreviewRes {
  String title = '';
  String description = '';
  String image = '';
  String url = '';

  LinkPreviewRes({ this.title, this.description, this.image, this.url });

  factory LinkPreviewRes.fromJson(Map<String, dynamic> jsonMap) {
    return LinkPreviewRes(
        title: jsonMap['title'],
        description: jsonMap['description'],
        image: jsonMap['image'],
        url: jsonMap['url']
    );
  }
}

class Home extends StatefulWidget {
  final String someArgs;
  Home({Key key, this.someArgs}) : super(key: key);

  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  String _lastSelected = 'TAB: 0';
  final User userStore = User();
  final PostStore postStore = PostStore();
  final _hackerNews = HackerNews();
  final snackBar = SnackBar(
    content: Text('Updating Posts requires some time, please wait...'),
    action: SnackBarAction(
      label: 'Okay!',
      onPressed: () {
        print('lol you thought this works?');
      },
    ),
  );
  bool _starred = false;
  LinkPreviewRes linkDetails = LinkPreviewRes(title: 'kyapwc - Overview', description: 'kyapwc has 4 repos available! Follow their code on Github.', image: 'https://avatars1.githubusercontent.com/u/22678613?s=400&v=4', url: 'https://github.com/kyapwc');

  @override
  initState() {
    super.initState();
    // when screen gets spawned, make sure to getNewsList first
    _hackerNews.getNewsList();
    userStore.getUserPosts();
    // Do this properly
    // postStore.getPost('1', '1');
  }

  void _selectedTab(int index) {
    // logging some useless info for future use, no worries
    debugPrint('TAB: $index');
    print('${postStore.post}');
    if(index == 2) {
      Navigator.pushNamed(context, '/PostAdd', arguments: 'userlo');
    }
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }

  Widget _makeArticleContainer(News newsArticle) {
    return Padding(
      key: Key(newsArticle.title),
      padding: EdgeInsets.all(16.0),
      child: Card(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.book, size: 64.0),
                title: Text('${newsArticle.title}'),
                subtitle: Text('${newsArticle.by}\'s Comments'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 95.0),
                child: Text(
                    '${DateTime.fromMicrosecondsSinceEpoch(newsArticle.time)}'),
              ),
              ButtonTheme.bar(
                child: ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: IconButton(
                        icon: Icon(Icons.launch),
                        onPressed: () async {
                          if (await canLaunch(newsArticle.url)) {
                            launch(newsArticle.url);
                          }
                        },
                      ),
                    ),
                    FlatButton(
                      child: Text('View'),
                      onPressed: () {
                        print('function not done yet');
                      },
                    ),
                    RaisedButton(
                      child: const Text('Logout'),
                      onPressed: () {
                        userStore.logout();
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/Auth', (Route<dynamic> route) => false);
                      },
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  Widget _buildPostHeader(String avatarUrl, String username) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: FadeInImage(
              image: NetworkImage(avatarUrl),
              height: 32.0,
              width: 32.0,
              placeholder: AssetImage('assets/Google-flutter-logo.png'),
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
              child: Text(username),
          ),
          IconButton(
              icon: Icon(Icons.star_border),
              onPressed: () {
                print('pressed mroe');
              },
          ),
          IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                Share.share('Hey I am using the new flutter App');
              },
          ),
        ],
      ),
    );
  }

  Widget _buildLinkUnfurler() {
    return Center(
        child: Card(
            child: Container(
                padding: EdgeInsets.all(16.0),
                width: MediaQuery.of(context).size.width / 2,
                child: GestureDetector(
                    onTap: () async {
                      if (await canLaunch(linkDetails.url)) {
                        launch(linkDetails.url);
                      }
                    },
                    child: Column(
                        children: <Widget>[
                          Text('${linkDetails.title}', style: TextStyle(color: Colors.grey)),
                          Column(
                              children: <Widget>[
                                FadeInImage(
                                    image: NetworkImage('${linkDetails.image}'),
                                    height: 150.0,
                                    width: 200.0,
                                    placeholder: AssetImage('assets/Google-flutter-logo.png'),
                                ),
                                SizedBox(height: 16.0),
                                Text('${linkDetails.description}', style: TextStyle(color: Colors.grey)),
                              ],
                          ),
                        ],
                    ),
                ),
            ),
        ),
    );
  }

  Widget _buildUserPostDetails(String username, String subtitle, String postId) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Text('$subtitle $subtitle $subtitle $subtitle'),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          _buildLinkUnfurler(),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/Post', arguments: postId);
            },
            child: Text(
              'View comments',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTopPost(int index) {
    return Container(
      margin: EdgeInsets.only(left: 4.0),
      decoration: BoxDecoration(
        border: Border.all(
            color: index == 0 ? Color(0xFFFFA726) : Colors.blueAccent,
            width: index == 0 ? 2 : 1),
        borderRadius: BorderRadius.all(
          Radius.circular(6.0),
        ),
      ),
      width: 160.0,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                flex: 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: FadeInImage(
                    image: AssetImage(
                        'assets/Google-flutter-logo.png'), // change later
                    height: 32.0,
                    width: 32.0,
                    placeholder: AssetImage('assets/Google-flutter-logo.png'),
                  ),
                ),
              ),
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 8.0),
                    Text(
                      'Cool new flutter functions!',
                      style: TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                    Text(
                      '21 mins ago',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 8.0,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            'Click me!',
          ),
          SizedBox(height: 8.0),
          index == 0
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      size: 16.0,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      'HOT',
                      style: TextStyle(fontSize: 8.0),
                    ),
                    SizedBox(
                      width: 4.0,
                    ),
                  ],
                )
              : Container()
        ],
      ),
    );
  }

  void _onExit(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure you want to logout?'),
            actions: <Widget>[
              FlatButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context); // This will just close the page
                  }),
              FlatButton(
                  child: Text('Logout'),
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/Auth', (Route<dynamic> route) => false);
                  }),
            ],
          );
        });
  }

  Widget _makeUserPosts(UserModel user) {
    // Get data for Post
    List<PostModel> posts = user.posts;
    PostModel data = posts[0];
    return Column(
      key: Key(user.id),
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildPostHeader(user.avatar, user.username),
            _buildUserPostDetails(user.username, data.title, data.id),
            SizedBox(height: 8.0),
            GestureDetector(
              onTap: () {
                userStore.logout();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    '/Auth', (Route<dynamic> route) => false);
              },
              child: Text('Logout',
                  style: TextStyle(fontSize: 16.0, color: Colors.white)),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home Screen',
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              _onExit(context);
            },
          ),
        ],
      ),
      body: Observer(
        builder: (context) => RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(Duration(seconds: 1));
                await userStore.getUserPosts();
                Scaffold.of(context).showSnackBar(snackBar);
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 16.0),
                  Container(
                    margin: EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Top Post',
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8.0),
                    height: 100.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        _buildTopPost(0),
                        SizedBox(
                          width: 8.0,
                        ),
                        _buildTopPost(1),
                        SizedBox(
                          width: 8.0,
                        ),
                        _buildTopPost(2),
                        SizedBox(
                          width: 8.0,
                        ),
                        _buildTopPost(3),
                      ],
                    ),
                    ),
                    Observer(
                        builder: (context) => ((userStore.userPosts != null) &&
                            (userStore.userPosts.isNotEmpty))
                        ? Container(
                            height: MediaQuery.of(context).size.height - 366.0,
                            child: ListView.builder(
                                itemCount: userStore.userPosts.length,
                                itemBuilder: (_, index) {
                                  final post = userStore.userPosts[index];
                                  return _makeUserPosts(post);
                                },
                            ),
                        )
                        : Center(
                            child: CircularProgressIndicator(),
                        ),
                    ),
                ],
              ),
            ),
      ),
      bottomNavigationBar: CustomBottomAppBar(
        color: Colors.grey,
        selectedColor: Colors.lightBlue[400],
        onTabSelected: _selectedTab,
        items: [
          CustomBottomAppBarItem(iconData: Icons.home),
          CustomBottomAppBarItem(iconData: Icons.search),
          CustomBottomAppBarItem(iconData: Icons.add),
          CustomBottomAppBarItem(iconData: Icons.list),
          CustomBottomAppBarItem(iconData: Icons.account_circle),
        ],
      ),
    );
  }
}
