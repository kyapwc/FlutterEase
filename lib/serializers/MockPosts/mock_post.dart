class Post {
  String id = '';
  String createdAt = '';
  String avatar = '';
  String postImageUrl = '';
  String username = '';
  String postSubtitle = '';
  String email = '';
  bool liked = false;

  Post({ this.id, this.createdAt, this.avatar, this.postImageUrl, this.username, this.postSubtitle, this.email, this.liked });

  factory Post.fromJson(Map<String, dynamic> jsonMap) {
    return Post(
        id: jsonMap['id'] ?? '0',
        createdAt: jsonMap['createdAt'] ?? '0',
        postImageUrl: jsonMap['postImageUrl'] ?? '0',
        username: jsonMap['username'] ?? 'Ken Yap',
        postSubtitle: jsonMap['postSubtitle'] ?? 'Some random subtitle',
        email: jsonMap['email'] ?? 'random.person@gmail.com',
        avatar: jsonMap['avatar'] ?? 'https://s3.amazonaws.com/uifaces/faces/twitter/msveet/128.jpg',
        liked: jsonMap['liked'] ?? false,
    );
  }
}
