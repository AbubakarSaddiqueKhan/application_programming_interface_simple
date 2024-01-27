import 'dart:convert';

import 'package:flutter_application_programming_interface_design/lecture_practice/json_place_holder_api/todo/todo_data_model.dart';
import 'package:http/http.dart' as http;

extension httpResponse on http.Response {
  bool isSuccess() => this.statusCode == 200;
  bool isNotFound() => this.statusCode == 404;
}

abstract class ApiProvider {
  String baseURL = "https://jsonplaceholder.typicode.com";
  String get apiUrl;
  String get url => baseURL + apiUrl;

  dynamic fetch({String endPoint = ""}) async {
    var response = await http.get(Uri.parse(url));
    if (response.isSuccess()) {
      return jsonDecode(response.body);
    }
    return null;
  }
}

class ToDoApiProvider extends ApiProvider {
  static ToDoApiProvider? _apiProvider;
  ToDoApiProvider.internal();
  factory ToDoApiProvider() {
    return _apiProvider ??= ToDoApiProvider.internal();
  }
  @override
  String get apiUrl => "/todos";

  Future<List<ToDoAPIModel>> fetchTodos() async {
    List todos = await fetch();
    return todos.map((map) => ToDoAPIModel.fromMap(map)).toList();
  }

  Future<ToDoAPIModel> fetchTodo(int index) async {
    var map = fetch(endPoint: "$index");
    return ToDoAPIModel.fromMap(map);
  }
}
