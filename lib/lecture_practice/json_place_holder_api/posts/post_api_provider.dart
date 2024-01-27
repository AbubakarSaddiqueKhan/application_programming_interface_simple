import 'dart:convert';

import 'package:flutter_application_programming_interface_design/lecture_practice/json_place_holder_api/posts/post_data_model.dart';
import 'package:http/http.dart' as http;

extension httpRespose on http.Response {
  bool isSuccess() => this.statusCode == 200;
  bool isNotFound() => this.statusCode == 404;
}

abstract class APIProvider {
  String baseUrl = "https://jsonplaceholder.typicode.com";
  String get apiUrl;
  String get url => baseUrl + apiUrl;

  dynamic fetch({String endPoint = ""}) async {
    var response = await http.get(Uri.parse(url + endPoint));
    if (response.isSuccess()) {
      return jsonDecode(response.body);
    }
    return null;
  }
}

class PostAPiProvider extends APIProvider {
  static PostAPiProvider? _postAPiProvider;

  PostAPiProvider.internal();

  factory PostAPiProvider() {
    return _postAPiProvider ??= PostAPiProvider.internal();
  }
  @override
  String get apiUrl => "/posts";

  Future<List<PostsAPIModel>> fetchPosts() async {
    List postModelList = await fetch();
    return postModelList.map((map) => PostsAPIModel.fromMap(map)).toList();
  }

  Future<PostsAPIModel> fetchPost(int index) async {
    var map = await fetch(endPoint: "$index");
    return PostsAPIModel.fromMap(map);
  }
}
