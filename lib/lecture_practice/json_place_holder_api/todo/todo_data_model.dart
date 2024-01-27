// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ToDoAPIModel {
  int? userId;
  int? id;
  String? title;
  bool? completed;
  ToDoAPIModel({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  // ToDoAPIModel({this.userId, this.id, this.title, this.completed});

  // ToDoAPIModel.fromJson(Map<String, dynamic> json) {
  //   userId = json['userId'];
  //   id = json['id'];
  //   title = json['title'];
  //   completed = json['completed'];
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['userId'] = this.userId;
  //   data['id'] = this.id;
  //   data['title'] = this.title;
  //   data['completed'] = this.completed;
  //   return data;
  // }

  ToDoAPIModel copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return ToDoAPIModel(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory ToDoAPIModel.fromMap(Map<String, dynamic> map) {
    return ToDoAPIModel(
      userId: map['userId'] != null ? map['userId'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      completed: map['completed'] != null ? map['completed'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ToDoAPIModel.fromJson(String source) =>
      ToDoAPIModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ToDoAPIModel(userId: $userId, id: $id, title: $title, completed: $completed)';
  }

  @override
  bool operator ==(covariant ToDoAPIModel other) {
    if (identical(this, other)) return true;

    return other.userId == userId &&
        other.id == id &&
        other.title == title &&
        other.completed == completed;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ id.hashCode ^ title.hashCode ^ completed.hashCode;
  }
}
