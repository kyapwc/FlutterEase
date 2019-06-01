import '../MockPost/mock_post.dart';

class UserModel {
  String id = '';
  String createdAt = '';
  String username = '';
  String avatar = '';
  String email = '';
  List<PostModel> posts = [];

  UserModel({ this.id, this.createdAt, this.username, this.avatar, this.email, this.posts });

  factory UserModel.fromJson(Map<String, dynamic> jsonMap) {
    var list = jsonMap['posts'] as List;

    List<PostModel> postList = list.map((i) => PostModel.fromJson(i)).toList();

    return UserModel(
      id: jsonMap['id'] ?? '0',
      createdAt: jsonMap['createdAt'] ?? '0',
      username: jsonMap['username'] ?? 'Flutter Hacker',
      avatar: jsonMap['avatar'] ??
          'https://s3.amazonaws.com/uifaces/faces/twitter/herkulano/128.jpg',
      email: jsonMap['email'] ?? 'flutter is the only way',
      posts: postList,
    );
  }
}
