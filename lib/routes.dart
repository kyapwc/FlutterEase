import 'package:flutter/material.dart';

// Screens for routes
import 'screens/auth/auth.dart';
import 'screens/home/home.dart';
import 'screens/post/post.dart';
import 'screens/postAdd/post_add.dart';
import 'screens/posted/posted.dart';

// TODO: Whenever there is a new route that needs to be added, please add to this Routes class //
class Routes {
  Routes() {
    runApp(MaterialApp(
            title: 'Flutter Hackathon Boilerplate',
            theme: ThemeData(
                primaryColor: Colors.lightBlue[400],
            ),
            home: Auth(),
            onGenerateRoute: (RouteSettings settings) {
              switch(settings.name) {
                case '/Auth':
                  return MaterialPageRoute(builder: (context) => Auth());
                  break;
                case '/Home':
                  String someArgs = settings.arguments;
                  return MaterialPageRoute(builder: (context) => Home(someArgs: someArgs));
                  break;
                case '/Post':
                  String postId = settings.arguments;
                  return MaterialPageRoute(builder: (context) => Post(postId: postId));
                case '/PostAdd':
                  String username = settings.arguments;
                  return MaterialPageRoute(builder: (context) => PostAdd(username: username));
                case '/Posted':
                  String username = settings.arguments;
                  return MaterialPageRoute(fullscreenDialog: true, builder: (context) => Posted());
              }
            }
    ));
  }
}
