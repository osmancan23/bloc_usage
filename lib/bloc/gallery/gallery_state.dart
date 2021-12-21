import 'package:flutter/foundation.dart';

import 'package:bloc_usage/model/gallery_model.dart';

abstract class GalleryState {
  GalleryState();
}

class GalleryInitial extends GalleryState {
  GalleryInitial();
}

class GalleryLoading extends GalleryState {
  GalleryLoading();
}

class GalleryCompleted extends GalleryState {
  final List<GalleryModel> response;

  GalleryCompleted(this.response);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GalleryCompleted && listEquals(other.response, response);
  }

  @override
  int get hashCode => response.hashCode;
}

class GalleryError extends GalleryState {
  final String message;
  GalleryError(this.message);
}
