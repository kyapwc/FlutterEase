import '../MockUser/mock_user.dart';

class Comment {
  String id = '';
  String postId = '';
  String createdAt = '';
  String description = '';
  int upvoted_no = 0;
  UserModel user = null;

  Comment(
      {this.id,
      this.postId,
      this.createdAt,
      this.description,
      this.upvoted_no,
      this.user});

  factory Comment.fromJson(Map<String, dynamic> jsonMap) {
    return Comment(
        id: jsonMap['id'] ?? '0',
        postId: jsonMap['postId'] ?? '0',
        createdAt: jsonMap['createdAt'] ?? '0',
        description: jsonMap['description'] ?? 'Flutter hackathon',
        upvoted_no: jsonMap['upvoted_no'] ?? 0,
        user: UserModel.fromJson(jsonMap['user']));
  }
}
