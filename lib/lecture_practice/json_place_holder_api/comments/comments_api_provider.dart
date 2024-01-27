import 'dart:convert';

import 'package:flutter_application_programming_interface_design/lecture_practice/json_place_holder_api/comments/comments_data_model.dart';
import 'package:http/http.dart' as http;

extension httpRespose on http.Response {
  bool isSuccess() => this.statusCode == 200;
  bool isNotFound() => this.statusCode == 404;
}

abstract class APIService {
  String baseUrl = "https://jsonplaceholder.typicode.com";
  String get apiUrl;
  String get URl => baseUrl + apiUrl;

  dynamic fetch({String endPoint = ""}) async {
    var response = await http.get(Uri.parse(URl));
    if (response.isSuccess()) {
      return jsonDecode(response.body);
    }
    return null;
  }
}

class CommentsAPIProvider extends APIService {
  static CommentsAPIProvider? _commentsAPIProvider;
  CommentsAPIProvider.internal();

  factory CommentsAPIProvider() {
    return _commentsAPIProvider ??= CommentsAPIProvider.internal();
  }

  @override
  String get apiUrl => "/comments";

  Future<List<CommentsAPIModel>> fetchComments() async {
    List commentsDataList = await fetch();
    return commentsDataList
        .map((map) => CommentsAPIModel.fromMap(map))
        .toList();
  }

  Future<CommentsAPIModel> fetchComment(int index) async {
    var map = await fetch(endPoint: "$index");
    return CommentsAPIModel.fromMap(map);
  }
}
