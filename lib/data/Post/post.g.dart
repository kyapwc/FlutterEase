// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$PostStore on _PostStore, Store {
  final _$postAtom = Atom(name: '_PostStore.post');

  @override
  PostModel get post {
    _$postAtom.reportObserved();
    return super.post;
  }

  @override
  set post(PostModel value) {
    _$postAtom.context.checkIfStateModificationsAreAllowed(_$postAtom);
    super.post = value;
    _$postAtom.reportChanged();
  }

  final _$_PostStoreActionController = ActionController(name: '_PostStore');

  @override
  void setPost(PostModel value) {
    final _$actionInfo = _$_PostStoreActionController.startAction();
    try {
      return super.setPost(value);
    } finally {
      _$_PostStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getPost(String userId, String postId) {
    final _$actionInfo = _$_PostStoreActionController.startAction();
    try {
      return super.getPost(userId, postId);
    } finally {
      _$_PostStoreActionController.endAction(_$actionInfo);
    }
  }
}
