// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CommentsAPIModel {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  CommentsAPIModel({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  // CommentsAPIModel.fromJson(Map<String, dynamic> json) {
  //   postId = json['postId'];
  //   id = json['id'];
  //   name = json['name'];
  //   email = json['email'];
  //   body = json['body'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['postId'] = this.postId;
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['email'] = this.email;
  //   data['body'] = this.body;
  //   return data;
  // }

  CommentsAPIModel copyWith({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) {
    return CommentsAPIModel(
      postId: postId ?? this.postId,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory CommentsAPIModel.fromMap(Map<String, dynamic> map) {
    return CommentsAPIModel(
      postId: map['postId'] != null ? map['postId'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      body: map['body'] != null ? map['body'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentsAPIModel.fromJson(String source) =>
      CommentsAPIModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CommentsAPIModel(postId: $postId, id: $id, name: $name, email: $email, body: $body)';
  }

  @override
  bool operator ==(covariant CommentsAPIModel other) {
    if (identical(this, other)) return true;

    return other.postId == postId &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.body == body;
  }

  @override
  int get hashCode {
    return postId.hashCode ^
        id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        body.hashCode;
  }
}
