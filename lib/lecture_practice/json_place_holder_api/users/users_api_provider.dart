import 'dart:convert';

import 'package:flutter_application_programming_interface_design/lecture_practice/json_place_holder_api/users/users_data_model.dart';
import 'package:http/http.dart' as http;

extension httpResponse on http.Response {
  bool isSuccess() => this.statusCode == 200;
  bool isNotFound() => this.statusCode == 404;
}

abstract class APIProvider {
  String baseUrl = "https://jsonplaceholder.typicode.com";
  String get apiUrl;
  String get url => baseUrl + apiUrl;

  dynamic fetch({String endPoint = ""}) async {
    var response = await http.get(Uri.parse(url));

    if (response.isSuccess()) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}

class UsersApiProvider extends APIProvider {
  @override
  String get apiUrl => "/users";

  static UsersApiProvider? _usersApiProvider;

  UsersApiProvider.internal();

  factory UsersApiProvider() {
    return _usersApiProvider ??= UsersApiProvider.internal();
  }

  Future<List<UsersAPIModel>> fetchUsersData() async {
    List usersData = await fetch();
    return usersData.map((map) => UsersAPIModel.fromMap(map)).toList();
  }

  Future<UsersAPIModel> fetchUserData(int index) async {
    var map = await fetch(endPoint: "$index");
    return UsersAPIModel.fromMap(map);
  }
}
