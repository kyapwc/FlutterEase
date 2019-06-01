import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/gestures.dart';

// import proper serializer
import 'package:hackathon_boilerplate/serializers/news.dart';
import 'package:hackathon_boilerplate/serializers/MockPosts/mock_post.dart';

import '../../data/Post/post.dart';

class Post extends StatefulWidget {
  final String postId;
  Post({Key key, this.postId}) : super(key: key);

  @override
  _PostState createState() => new _PostState();
}

class _PostState extends State<Post> {
  final PostStore postStore = PostStore();

  @override
  initState() {
    super.initState();
    postStore.getPost('1', '1');
  }

  Widget _buildComment() {
    return Container(
      margin: EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: FadeInImage(
              image:
                  AssetImage('assets/Google-flutter-logo.png'), // Change later
              height: 32.0,
              width: 32.0,
              placeholder: AssetImage('assets/Google-flutter-logo.png'),
            ),
          ),
          SizedBox(width: 4.0),
          GestureDetector(
            onTap: () {
              print('username tapped');
            },
            child: Text(
              'Ken Yap', // CHange later
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 6.0),
          Expanded(
            child: Text(
              'Awesome concept!',
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              size: 12.0,
            ),
            onPressed: () {
              Icon(Icons.favorite);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPostHeader() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(50.0),
            child: FadeInImage(
              image:
                  AssetImage('assets/Google-flutter-logo.png'), // Change later
              height: 48.0,
              width: 48.0,
              placeholder: AssetImage('assets/Google-flutter-logo.png'),
            ),
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: GestureDetector(
              onTap: () {
                print('username tapped');
              },
              child: Text(
                'Gary', // CHange later
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              print('pressed more');
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Detail'),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            _buildPostHeader(),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blueAccent,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(6.0),
                ),
              ),
              width: MediaQuery.of(context).size.width - 32,
              child: Container(
                margin: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Some cool new things about flutter!',
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16.0),
                    Column(
                      children: <Widget>[
                        Text(
                          'Did you know flutter can do this?',
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.star,
                  color: Theme.of(context).primaryColor,
                ),
                Text('Voted: 10000'), //A voted number
              ],
            ),
            SizedBox(height: 16.0),
            Divider(),
            SizedBox(height: 16.0),
            _buildComment(),
            _buildComment(),
            _buildComment(),
            _buildComment(),
          ],
        ),
      ),
    );
  }
}
