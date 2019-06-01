class NewsList {
  List topStoryIndexes = [];

  NewsList({this.topStoryIndexes });

  // Serializer to serialize the integers
  factory NewsList.fromJson(List<dynamic> newsList) {
    return NewsList(topStoryIndexes: newsList);
  }
}
