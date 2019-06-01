class Constants {
  static String newsListUrl =
      'https://hacker-news.firebaseio.com/v0/topstories.json';

  static String newsUrl(int newsId) {
    return 'https://hacker-news.firebaseio.com/v0/item/$newsId.json';
  }

  static String getPosts =
      'https://5cf14f533db50700145db77e.mockapi.io/api/v1/users';

  static String getPost(String userId, String postId) {
    return 'https://5cf14f533db50700145db77e.mockapi.io/api/v1/users/$userId/posts/$postId';
  }

  static String getComments(String userId, String postId) {
    return 'https://5cf14f533db50700145db77e.mockapi.io/api/v1/users/$userId/posts/$postId/comments';
  }
}
