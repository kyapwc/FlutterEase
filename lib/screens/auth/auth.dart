import 'package:flutter/material.dart';
import 'package:hackathon_boilerplate/widgets/app_button/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/services.dart';

// import User Store
import '../../data/User/user.dart';

class Auth extends StatefulWidget {
  Auth({ Key key, this.title }) : super(key: key);

  final String title;

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final User userStore = User();
  final FocusNode _userId = FocusNode(); // For UX, point to next focus
  final FocusNode _userPassword = FocusNode();

  @override
  void initState() {
    super.initState();
    userStore.setupValidations();
    new Future.delayed(Duration.zero,() async {
      final localStorage = await SharedPreferences.getInstance();
      if (localStorage.getBool('loggedIn') != null && localStorage.getBool('loggedIn')) {
        Navigator
            .of(context)
            .pushNamedAndRemoveUntil('/Home', (Route<dynamic> route) => false);
      }
    });
  }

  // handle disposal of screen
  void dispose() {
    userStore.dispose();
    super.dispose();
  }

  // A function to set the next focus feild
  void _fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  Widget _buildLogo(double deviceWidth) {
    return Container(
      margin: EdgeInsets.only(top: 16.0),
      child: Image.asset(
        'assets/Google-flutter-logo.png',
        height: 100,
        width: deviceWidth,
      ),
    );
  }

  Widget _buildEnterEmail() {
    return Observer(
      builder: (_) => TextField(
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onSubmitted: (_) {
          _fieldFocusChange(context, _userId, _userPassword);
        },
        focusNode: _userId,
        onChanged: userStore.setEmail,
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'Enter your email address',
          errorText: userStore.error.email,
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Observer(
      builder: (_) => TextField(
        focusNode: _userPassword,
        onChanged: userStore.setPassword,
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'Shh, it\'s a password',
          errorText: userStore.error.password,
        ),
        obscureText: true,
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
            child: RaisedButton(
              color: Colors.cyan,
              onPressed: () {
                userStore.validateAll();
                if (userStore.canLogin) {
                  Navigator
                    .of(context)
                    .pushNamedAndRemoveUntil('/Home', (Route<dynamic> route) => false, arguments: 'lol');
                }
              },
              child: Text('Login'),
              textColor: Colors.white,
              shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          )
        ],
    );
  }

  Widget _buildRegisterButton() {
    return Align(
        alignment: Alignment.bottomCenter,
        child: FlatButton(
            onPressed: () {},
            child: Text(
              'Haven\'t get your account yet?',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey)
            ),
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.85;

    return MaterialApp(
      title: 'Flutter Layout',
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              if (_userId.hasFocus) _userId.unfocus();
              if (_userPassword.hasFocus) _userPassword.unfocus();
              SystemChannels.textInput.invokeMethod('TextInput.hide');
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _buildLogo(deviceWidth),
                  Container(
                    padding: EdgeInsets.only(bottom: 16.0),
                    width: targetWidth,
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 16.0),
                          _buildEnterEmail(),
                          SizedBox(height: 16.0),
                          _buildPasswordTextField(),
                          SizedBox(height: 16.0),
                          _buildSubmitForm(),
                        ],
                      ),
                    ),
                  ),
                  _buildRegisterButton()
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
