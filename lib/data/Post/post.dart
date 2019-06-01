import 'package:mobx/mobx.dart';

import 'dart:convert';

import 'package:hackathon_boilerplate/serializers/MockPost/mock_post.dart';
import 'package:hackathon_boilerplate/utils/constants.dart';
import 'package:http/http.dart' as http;

part 'post.g.dart';

class PostStore = _PostStore with _$PostStore;

abstract class _PostStore with Store {
  @observable
  PostModel post;

  @action
  void setPost(PostModel value) {
    post = value;
  }

  @action
  getPost(String userId, String postId) {
    fetchPost(userId, postId).then((post) {
      setPost(post);
    });
  }
}

Future<PostModel> fetchPost(String userId, String postId) async {
  final response = await http.get(Constants.getPost(userId, postId));

  if (response.statusCode == 200) {
    var parsedJson = json.decode(response.body);
    print('parsedJSON: ${parsedJson.toString()}');
    PostModel post = PostModel.fromJson(parsedJson);
    return post;
  } else {
    throw Exception('failed to retrieve posts');
  }
}
