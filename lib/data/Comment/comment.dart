// import 'package:mobx/mobx.dart';

// import 'dart:convert';

// // TODO: Import the serializer for the CommentStore
// import 'package:hackathon_boilerplate/utils/constants.dart';
// import 'package:http/http.dart' as http;

// part 'comment.g.dart';

// class CommentStore = _CommentStore with _$CommentStore;

// abstract class _CommentStore with Store {
//   @observable
//   Comment comment;

//   @observable
//   List comments = [];

//   @action
//   void setComments(List value) {
//     comments = value;
//   }

//   @action
//   getComments(String userId, String postId) {
//     fetchComments(userId, postId).then((comments) {
//       setComments(comments);
//     });
//   }
// }

// Future<List> fetchComments(String userId, String postId) async {
//   final response = await http.get(Constants.getComments(userId, postId));

//   if (response.statusCode == 200) {
//     List comments = [];
//     var parsedJson = json.decode(response.body);
//     print('parsedJSON, fectComments: ${parsedJson.toString()}');
//     for (var comment in parsedJson) {
//       Comment comment = Comment.fromJson(comment);
//       comments.add(comment);
//     }
//     return comments;
//   } else {
//     throw Exception('failed to retrieve posts');
//   }
// }
