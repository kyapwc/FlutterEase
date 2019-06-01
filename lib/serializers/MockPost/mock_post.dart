class PostModel {
  String id = '';
  String createdAt = '';
  String title = '';
  String description = '';
  int upvoted_number = 0;

  PostModel({ this.id, this.createdAt, this.title, this.description, this.upvoted_number });

  factory PostModel.fromJson(Map<String, dynamic> jsonMap) {
    return PostModel(
      id: jsonMap['id'] ?? '0',
      createdAt: jsonMap['createdAt'] ?? '0',
      title: jsonMap['title'] ?? "Flutter hackathon",
      description: jsonMap['description'] ??
          'This hackathon is a test for application development.',
      upvoted_number: jsonMap['upvoted_number'] ?? 0,
    );
  }
}
