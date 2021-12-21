import 'dart:convert';

import 'package:bloc_usage/model/base_model.dart';

PostModel postModelFromJson(String str) => PostModel.fromJson(json.decode(str) as Map<String, String>);

String postModelToJson(PostModel data) => json.encode(data.toJson());

class PostModel extends BaseModel {
  PostModel({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  int? userId;
  int? id;
  String? title;
  String? body;

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        userId: json["userId"] as int,
        id: json["id"] as int,
        title: json["title"] as String,
        body: json["body"] as String,
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
