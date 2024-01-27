import 'dart:convert';

import 'package:flutter_application_programming_interface_design/lecture_practice/json_place_holder_api/album/album_api_model.dart';
import 'package:http/http.dart' as http;

// Make a separate extension onn http response and use it every time where you need .

extension ResponseCode on http.Response {
  bool isSuccess() => this.statusCode == 200;
  bool isNotFound() => this.statusCode == 404;
}

// ii ) Make an abstract class of Api Provider or api service class (general) .

abstract class APIService {
  // Make a complete  url from base url and api url .
  String baseURL = "https://jsonplaceholder.typicode.com";
  String get apiUrl;
  String get url => baseURL + apiUrl;

  // iv ) Creates all of the method's you need in my opinion here you need to create all of the possible crud operation or method's like
  // get , put , post , patch , update , delete .

  dynamic fetch({String endPoint = ""}) async {
    var response = await http.get(Uri.parse(url + endPoint));
    if (response.isSuccess()) {
      return jsonDecode(response.body);
    }
    return null;
  }
}

// iii ) Make a separate special api service or api provider class that will extend the api service or api provider class that is same in all of the classes .

class AlbumAPiService extends APIService {
  // Make a singleton design pattern to allow the constructor to make the object for only one time .

  static AlbumAPiService? _albumAPiService;

  AlbumAPiService.internal();

  factory AlbumAPiService() {
    return _albumAPiService ??= AlbumAPiService.internal();
  }

  @override
  String get apiUrl => "/albums";

  // iv ) Perform all of the possible operation's here  .

  Future<List<AlbumAPIModel>> fetchAlbums() async {
    List albumList = await fetch();
    return albumList.map((map) => AlbumAPIModel.fromMap(map)).toList();
  }

  Future<AlbumAPIModel> fetchAlbum(int albumId) async {
    var map = await fetch(endPoint: "$albumId");
    return AlbumAPIModel.fromMap(map);
  }
}
