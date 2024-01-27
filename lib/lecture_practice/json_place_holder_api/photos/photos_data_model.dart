// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PhotosAPIModel {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;
  PhotosAPIModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  // PhotosAPIModel(
  //     {this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  // PhotosAPIModel.fromJson(Map<String, dynamic> json) {
  //   albumId = json['albumId'];
  //   id = json['id'];
  //   title = json['title'];
  //   url = json['url'];
  //   thumbnailUrl = json['thumbnailUrl'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['albumId'] = this.albumId;
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['url'] = this.url;
  //   data['thumbnailUrl'] = this.thumbnailUrl;
  //   return data;
  // }

  PhotosAPIModel copyWith({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) {
    return PhotosAPIModel(
      albumId: albumId ?? this.albumId,
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory PhotosAPIModel.fromMap(Map<String, dynamic> map) {
    return PhotosAPIModel(
      albumId: map['albumId'] != null ? map['albumId'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
      thumbnailUrl:
          map['thumbnailUrl'] != null ? map['thumbnailUrl'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PhotosAPIModel.fromJson(String source) =>
      PhotosAPIModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PhotosAPIModel(albumId: $albumId, id: $id, title: $title, url: $url, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(covariant PhotosAPIModel other) {
    if (identical(this, other)) return true;

    return other.albumId == albumId &&
        other.id == id &&
        other.title == title &&
        other.url == url &&
        other.thumbnailUrl == thumbnailUrl;
  }

  @override
  int get hashCode {
    return albumId.hashCode ^
        id.hashCode ^
        title.hashCode ^
        url.hashCode ^
        thumbnailUrl.hashCode;
  }
}
