import 'package:mobx/mobx.dart';
import 'dart:convert';

import 'package:hackathon_boilerplate/serializers/news.dart';
import 'package:hackathon_boilerplate/serializers/news_list.dart';
import 'package:hackathon_boilerplate/utils/constants.dart';
import 'package:http/http.dart' as http;

part 'hacker_news.g.dart';

class HackerNews = HackerNewsBase with _$HackerNews;

abstract class HackerNewsBase with Store {
  @observable
  List newsList = [];
  @observable
  List<News> news = [];
  @observable
  int newsLimit = 5;

  @action
  void setNews(List<News> value) {
    news = value;
  }

  @action
  increaseNewsLimit() {
    newsLimit = newsLimit + 5;
    getNewsList();
  }

  @action
  getNewsList() {
    fetchNewsList().then((newsListObj) {
      newsList = newsListObj.topStoryIndexes;
      getNews(newsList, newsLimit).then((listOfArticles) {
        List<News> listOfNews = news;
        listOfArticles.forEach((newsArticle) {
          listOfNews.add(newsArticle);
        });
        setNews(listOfNews);
      });
    });
  }
}

Future<NewsList> fetchNewsList() async {
  final response = await http.get(Constants.newsListUrl);

  if (response.statusCode == 200) {
    var parsedJson = json.decode(response.body);
    return NewsList.fromJson(parsedJson);
  } else {
    throw Exception('Failed to get news list...');
  }
}

Future<List<News>> getNews(List newsIdList, int indexRange) async {
  List<News> listOfNews = [];
  for (int index = (indexRange - 5); index < indexRange; index++) {
    News news = await fetchNews(int.parse(newsIdList[index].toString()));
    listOfNews.add(news);
  }
  return listOfNews;
}

Future<News> fetchNews(int newsId) async {
  String url = Constants.newsUrl(newsId);
  final response = await http.get(url);

  if (response.statusCode == 200) {
    var parsedJson = json.decode(response.body);
    return News.fromJson(parsedJson);
  } else {
    throw Exception('Failed to load post for Id ${newsId}');
  }
}
