import 'dart:convert';

import 'package:http/http.dart' as http;

import 'universities_data_model.dart';

extension httpResponse on http.Response {
  bool isSuccess() => this.statusCode == 200;
  bool isNotFound() => this.statusCode == 404;
}

abstract class ApiProvider {
  String baseUrl = "http://universities.hipolabs.com";
  String get apiUrl;
  String get url => baseUrl + apiUrl;

  dynamic fetch({String endpoint = ""}) async {
    var response = await http.get(Uri.parse(url));

    if (response.isSuccess()) {
      return jsonEncode(response.body);
    }
    return null;
  }
}

class UniversitiesApiProvider extends ApiProvider {
  Future<List<UniversitiesDataModel>> fetchUniversitiesData() async {
    List universities = await fetch();
    return universities
        .map((map) => UniversitiesDataModel.fromMap(map))
        .toList();
  }

  Future<UniversitiesDataModel> fetchUniversity(int index) async {
    var map = await fetch(endpoint: "$index");
    return UniversitiesDataModel.fromMap(map);
  }

  @override
  String get apiUrl => "/search?country=United+States";

  static UniversitiesApiProvider? _universitiesApiProvider;

  UniversitiesApiProvider.internal();

  factory UniversitiesApiProvider() {
    return _universitiesApiProvider ??= UniversitiesApiProvider.internal();
  }
}
