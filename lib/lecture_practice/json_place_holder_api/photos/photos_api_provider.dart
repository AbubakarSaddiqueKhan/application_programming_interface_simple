import 'dart:convert';

import 'package:flutter_application_programming_interface_design/lecture_practice/json_place_holder_api/photos/photos_data_model.dart';
import 'package:http/http.dart' as http;

extension httpResponse on http.Response {
  bool isSuccess() => this.statusCode == 200;
  bool isNotFound() => this.statusCode == 404;
}

abstract class ApiProvider {
  String baseUrl = "https://jsonplaceholder.typicode.com";
  String get apiUrl;
  String get url => baseUrl + apiUrl;

  dynamic fetch({String endPoint = ""}) async {
    var response = await http.get(Uri.parse(url));

    if (response.isSuccess()) {
      return jsonDecode(response.body);
    }
    return null;
  }
}

class PhotosApiProvider extends ApiProvider {
  static PhotosApiProvider? _photosApiProvider;

  PhotosApiProvider.internal();

  factory PhotosApiProvider() {
    return _photosApiProvider ??= PhotosApiProvider.internal();
  }

  @override
  String get apiUrl => "/photos";

  Future<List<PhotosAPIModel>> fetchPhotos() async {
    List photos = await fetch();
    return photos.map((map) => PhotosAPIModel.fromMap(map)).toList();
  }

  Future<PhotosAPIModel> fetchPhoto(int index) async {
    var map = await fetch(endPoint: "$index");
    return PhotosAPIModel.fromMap(map);
  }
}
