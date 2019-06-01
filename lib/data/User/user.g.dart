// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$User on _User, Store {
  Computed<bool> _$canLoginComputed;

  @override
  bool get canLogin =>
      (_$canLoginComputed ??= Computed<bool>(() => super.canLogin)).value;

  final _$emailAtom = Atom(name: '_User.email');

  @override
  String get email {
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.checkIfStateModificationsAreAllowed(_$emailAtom);
    super.email = value;
    _$emailAtom.reportChanged();
  }

  final _$passwordAtom = Atom(name: '_User.password');

  @override
  String get password {
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.checkIfStateModificationsAreAllowed(_$passwordAtom);
    super.password = value;
    _$passwordAtom.reportChanged();
  }

  final _$loggedInAtom = Atom(name: '_User.loggedIn');

  @override
  bool get loggedIn {
    _$loggedInAtom.reportObserved();
    return super.loggedIn;
  }

  @override
  set loggedIn(bool value) {
    _$loggedInAtom.context.checkIfStateModificationsAreAllowed(_$loggedInAtom);
    super.loggedIn = value;
    _$loggedInAtom.reportChanged();
  }

  final _$userPostsAtom = Atom(name: '_User.userPosts');

  @override
  List get userPosts {
    _$userPostsAtom.reportObserved();
    return super.userPosts;
  }

  @override
  set userPosts(List value) {
    _$userPostsAtom.context
        .checkIfStateModificationsAreAllowed(_$userPostsAtom);
    super.userPosts = value;
    _$userPostsAtom.reportChanged();
  }

  final _$postsAtom = Atom(name: '_User.posts');

  @override
  List get posts {
    _$postsAtom.reportObserved();
    return super.posts;
  }

  @override
  set posts(List value) {
    _$postsAtom.context.checkIfStateModificationsAreAllowed(_$postsAtom);
    super.posts = value;
    _$postsAtom.reportChanged();
  }

  final _$_UserActionController = ActionController(name: '_User');

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_UserActionController.startAction();
    try {
      return super.setEmail(value);
    } finally {
      _$_UserActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_UserActionController.startAction();
    try {
      return super.setPassword(value);
    } finally {
      _$_UserActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoggedIn(bool value) {
    final _$actionInfo = _$_UserActionController.startAction();
    try {
      return super.setLoggedIn(value);
    } finally {
      _$_UserActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_UserActionController.startAction();
    try {
      return super.validatePassword(value);
    } finally {
      _$_UserActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_UserActionController.startAction();
    try {
      return super.validateEmail(value);
    } finally {
      _$_UserActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUserPosts(List value) {
    final _$actionInfo = _$_UserActionController.startAction();
    try {
      return super.setUserPosts(value);
    } finally {
      _$_UserActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getUserPosts() {
    final _$actionInfo = _$_UserActionController.startAction();
    try {
      return super.getUserPosts();
    } finally {
      _$_UserActionController.endAction(_$actionInfo);
    }
  }
}

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$FormErrorState on _FormErrorState, Store {
  Computed<bool> _$hasErrorsComputed;

  @override
  bool get hasErrors =>
      (_$hasErrorsComputed ??= Computed<bool>(() => super.hasErrors)).value;

  final _$emailAtom = Atom(name: '_FormErrorState.email');

  @override
  String get email {
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.checkIfStateModificationsAreAllowed(_$emailAtom);
    super.email = value;
    _$emailAtom.reportChanged();
  }

  final _$passwordAtom = Atom(name: '_FormErrorState.password');

  @override
  String get password {
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.checkIfStateModificationsAreAllowed(_$passwordAtom);
    super.password = value;
    _$passwordAtom.reportChanged();
  }
}
