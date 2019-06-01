import 'package:flutter/material.dart';
import 'package:hackathon_boilerplate/widgets/app_button/index.dart';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/services.dart';

// import User Store
import '../../data/User/user.dart';

class PostAdd extends StatefulWidget {
  PostAdd({Key key, this.username}) : super(key: key);

  final String username;

  @override
  _PostAddState createState() => _PostAddState();
}

class _PostAddState extends State<PostAdd> {
  final FocusNode _postTitle = FocusNode(); // For UX, point to next focus
  final FocusNode _postDescription = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  // A function to set the next focus feild
  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  Widget _buildTitleTextField() {
    return Observer(
      builder: (_) => TextField(
            textInputAction: TextInputAction.next,
            onSubmitted: (_) {
              _fieldFocusChange(context, _postTitle, _postDescription);
            },
            focusNode: _postTitle,
            decoration: InputDecoration(
              labelText: 'Title',
              hintText: 'Give your post a name',
            ),
          ),
    );
  }

  Widget _buildDescriptionTextField() {
    return Observer(
      builder: (_) => TextField(
            focusNode: _postDescription,
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            decoration: InputDecoration(
              labelText: 'Description',
              hintText: 'Share some mind-blowing idea!',
            ),
          ),
    );
  }

  Widget _buildSubmitForm() {
    return ButtonBar(
      alignment: MainAxisAlignment.center,
      children: <Widget>[
        ButtonTheme(
            minWidth: 150,
            height: 45.0,
              child: Container(
                child: RaisedButton(
                  color: Colors.green[400],
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/Posted', (Route<dynamic> route) => false,
                        );
                  },
                  child: Hero(
                             tag: "Posted",
                             child: Text('Post')
                         ),
                  textColor: Colors.white,
                  shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
              )),
            )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.85;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
        title: Text(
          'Add a post',
          style: TextStyle(color: Colors.white),
        ),
        ),
        body: Center(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (_postTitle.hasFocus) _postTitle.unfocus();
              if (_postDescription.hasFocus) _postDescription.unfocus();
              SystemChannels.textInput.invokeMethod('TextInput.hide');
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(bottom: 16.0),
                      width: targetWidth,
                      child: Form(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 16.0),
                            _buildTitleTextField(),
                            SizedBox(height: 16.0),
                            _buildDescriptionTextField(),
                            SizedBox(height: 16.0),
                            _buildSubmitForm(),
                          ],
                        ),
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
