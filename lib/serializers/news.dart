class News {
  String title = '';
  String url = '';
  String by = '';
  int time = 0;
  int score = 0;

  News({ this.title, this.url, this.by, this.time, this.score });

  factory News.fromJson(Map<String, dynamic> jsonMap) {
    return News(
        title: jsonMap['title'] ?? 'No Title Found',
        url: jsonMap['url'] ?? 'http://www.flutter.dev',
        by: jsonMap['by'] ?? 'Author Not Identified',
        time: jsonMap['time'] ?? 'Time Is Not Recorded',
        score: jsonMap['score'] ?? 'News was not scored',
    );
  }
}
