// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// i ) Make a data model class

class AlbumAPIModel {
  int? userId;
  int? id;
  String? title;

  AlbumAPIModel({
    this.userId,
    this.id,
    this.title,
  });

  // AlbumAPIModel.fromJson(Map<String, dynamic> json) {
  //   userId = json['userId'];
  //   id = json['id'];
  //   title = json['title'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['userId'] = this.userId;
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   return data;
  // }

  AlbumAPIModel copyWith({
    int? userId,
    int? id,
    String? title,
  }) {
    return AlbumAPIModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
    };
  }

  factory AlbumAPIModel.fromMap(Map<String, dynamic> map) {
    return AlbumAPIModel(
      userId: map['userId'] != null ? map['userId'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AlbumAPIModel.fromJson(String source) =>
      AlbumAPIModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AlbumAPIModel(userId: $userId, id: $id, title: $title)';

  @override
  bool operator ==(covariant AlbumAPIModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId && other.id == id && other.title == title;
  }

  @override
  int get hashCode => userId.hashCode ^ id.hashCode ^ title.hashCode;
}
