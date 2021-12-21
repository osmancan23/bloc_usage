import 'dart:convert';

import 'package:bloc_usage/model/base_model.dart';

GalleryModel galleryModelFromJson(String str) => GalleryModel.fromJson(json.decode(str));

String galleryModelToJson(GalleryModel data) => json.encode(data.toJson());

class GalleryModel extends BaseModel {
  GalleryModel({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  factory GalleryModel.fromJson(Map<String, dynamic> json) => GalleryModel(
        albumId: json["albumId"] == null ? null : json["albumId"],
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
        url: json["url"] == null ? null : json["url"],
        thumbnailUrl: json["thumbnailUrl"] == null ? null : json["thumbnailUrl"],
      );

  Map<String, dynamic> toJson() => {
        "albumId": albumId == null ? null : albumId,
        "id": id == null ? null : id,
        "title": title == null ? null : title,
        "url": url == null ? null : url,
        "thumbnailUrl": thumbnailUrl == null ? null : thumbnailUrl,
      };
}
