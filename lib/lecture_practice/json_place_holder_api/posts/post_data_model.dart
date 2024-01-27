// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PostsAPIModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostsAPIModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  // PostsAPIModel.fromJson(Map<String, dynamic> json) {
  //   userId = json['userId'];
  //   id = json['id'];
  //   title = json['title'];
  //   body = json['body'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['userId'] = this.userId;
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['body'] = this.body;
  //   return data;
  // }

  PostsAPIModel copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostsAPIModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory PostsAPIModel.fromMap(Map<String, dynamic> map) {
    return PostsAPIModel(
      userId: map['userId'] != null ? map['userId'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      body: map['body'] != null ? map['body'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PostsAPIModel.fromJson(String source) =>
      PostsAPIModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PostsAPIModel(userId: $userId, id: $id, title: $title, body: $body)';
  }

  @override
  bool operator ==(covariant PostsAPIModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.id == id &&
        other.title == title &&
        other.body == body;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ id.hashCode ^ title.hashCode ^ body.hashCode;
  }
}
