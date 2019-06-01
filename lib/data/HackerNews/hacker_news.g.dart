// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hacker_news.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$HackerNews on HackerNewsBase, Store {
  final _$newsListAtom = Atom(name: 'HackerNewsBase.newsList');

  @override
  List get newsList {
    _$newsListAtom.reportObserved();
    return super.newsList;
  }

  @override
  set newsList(List value) {
    _$newsListAtom.context.checkIfStateModificationsAreAllowed(_$newsListAtom);
    super.newsList = value;
    _$newsListAtom.reportChanged();
  }

  final _$newsAtom = Atom(name: 'HackerNewsBase.news');

  @override
  List<News> get news {
    _$newsAtom.reportObserved();
    return super.news;
  }

  @override
  set news(List<News> value) {
    _$newsAtom.context.checkIfStateModificationsAreAllowed(_$newsAtom);
    super.news = value;
    _$newsAtom.reportChanged();
  }

  final _$newsLimitAtom = Atom(name: 'HackerNewsBase.newsLimit');

  @override
  int get newsLimit {
    _$newsLimitAtom.reportObserved();
    return super.newsLimit;
  }

  @override
  set newsLimit(int value) {
    _$newsLimitAtom.context
        .checkIfStateModificationsAreAllowed(_$newsLimitAtom);
    super.newsLimit = value;
    _$newsLimitAtom.reportChanged();
  }

  final _$HackerNewsBaseActionController =
      ActionController(name: 'HackerNewsBase');

  @override
  void setNews(List<News> value) {
    final _$actionInfo = _$HackerNewsBaseActionController.startAction();
    try {
      return super.setNews(value);
    } finally {
      _$HackerNewsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic increaseNewsLimit() {
    final _$actionInfo = _$HackerNewsBaseActionController.startAction();
    try {
      return super.increaseNewsLimit();
    } finally {
      _$HackerNewsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getNewsList() {
    final _$actionInfo = _$HackerNewsBaseActionController.startAction();
    try {
      return super.getNewsList();
    } finally {
      _$HackerNewsBaseActionController.endAction(_$actionInfo);
    }
  }
}
