// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'comment.dart';

// // **************************************************************************
// // StoreGenerator
// // **************************************************************************

// // ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

// mixin _$CommentStore on _CommentStore, Store {
//   final _$commentAtom = Atom(name: '_CommentStore.comment');

//   @override
//   dynamic get comment {
//     _$commentAtom.reportObserved();
//     return super.comment;
//   }

//   @override
//   set comment(dynamic value) {
//     _$commentAtom.context.checkIfStateModificationsAreAllowed(_$commentAtom);
//     super.comment = value;
//     _$commentAtom.reportChanged();
//   }

//   final _$commentsAtom = Atom(name: '_CommentStore.comments');

//   @override
//   List get comments {
//     _$commentsAtom.reportObserved();
//     return super.comments;
//   }

//   @override
//   set comments(List value) {
//     _$commentsAtom.context.checkIfStateModificationsAreAllowed(_$commentsAtom);
//     super.comments = value;
//     _$commentsAtom.reportChanged();
//   }

//   final _$_CommentStoreActionController =
//       ActionController(name: '_CommentStore');

//   @override
//   void setComments(List value) {
//     final _$actionInfo = _$_CommentStoreActionController.startAction();
//     try {
//       return super.setComments(value);
//     } finally {
//       _$_CommentStoreActionController.endAction(_$actionInfo);
//     }
//   }

//   @override
//   dynamic getComments(String userId, String postId) {
//     final _$actionInfo = _$_CommentStoreActionController.startAction();
//     try {
//       return super.getComments(userId, postId);
//     } finally {
//       _$_CommentStoreActionController.endAction(_$actionInfo);
//     }
//   }
// }
