import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';
// shared_preferences are basically localStorage
import 'package:shared_preferences/shared_preferences.dart';
// used to serialize the data for us
import 'dart:convert';

import 'package:hackathon_boilerplate/serializers/MockPost/mock_post.dart';
import 'package:hackathon_boilerplate/serializers/MockUser/mock_user.dart';
import 'package:hackathon_boilerplate/serializers/MockPosts/mock_posts_list.dart';
import 'package:hackathon_boilerplate/utils/constants.dart';
import 'package:http/http.dart' as http;

part 'user.g.dart';

class User = _User with _$User;

abstract class _User with Store {
  // handle form for login
  final FormErrorState error = FormErrorState();
  @observable
  String email = '';
  @observable
  String password = '';
  @observable
  bool loggedIn = false;

  @computed
  bool get canLogin => !error.hasErrors;

  // for mock users
  @observable
  List userPosts = [];

  @observable
  List posts = [];

  // Disposers
  List<ReactionDisposer> _disposers;

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setLoggedIn(bool value) {
    loggedIn = value;
  }

  @action
  void validatePassword(String value) {
    error.password = isNull(value) || value.isEmpty ? 'Password cannot be blank.' : null;
  }

  @action
  void validateEmail(String value) {
    // isEmail is a helper function from the validators library that was imported
    error.email = isEmail(value) ? null : 'Not a valid email format.';
  }

  void saveUser() async {
    // getting the sharedpreference instance to use
    final localStorage = await SharedPreferences.getInstance();
    localStorage.setString('email', email);
    localStorage.setBool('loggedIn', true);
  }

  // when user logout, remove everything
  void logout() async {
    final localStorage = await SharedPreferences.getInstance();
    localStorage.remove('email');
    localStorage.remove('loggedIn');
  }

  void setupValidations() {
    _disposers = [
      reaction((_) => email, validateEmail),
      reaction((_) => password, validatePassword)
    ];
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validateEmail(email);
    validatePassword(password);
    if (canLogin) {
      saveUser();
    }
  }

  @action
  setUserPosts(List value) {
    userPosts = value;
  }

  @action
  getUserPosts() {
    fetchPosts().then((userPost) {
      setUserPosts(userPost);
    });
  }
}

class FormErrorState = _FormErrorState with _$FormErrorState;

abstract class _FormErrorState with Store {
  @observable
  String email;

  @observable
  String password;

  @computed
  bool get hasErrors => email != null || password != null;
}

// API Calls below this
Future<List> fetchPosts() async {
  final response = await http.get(Constants.getPosts);

  if (response.statusCode == 200) {
    List userPosts = [];
    var parsedJson = json.decode(response.body);
    for (var user in parsedJson) {
      UserModel data = UserModel.fromJson(user);
      userPosts.add(data);
    }
    return userPosts;
  } else {
    throw Exception('failed to retrieve posts');
  }
}
