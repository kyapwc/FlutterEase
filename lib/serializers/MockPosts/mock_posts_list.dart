import 'mock_post.dart';

class PostList {
  List<dynamic> posts;

  PostList({ this.posts });

  factory PostList.fromJson(List<dynamic> value) {
    return PostList(posts: value);
  }
}
