import 'package:flutter/foundation.dart';

import '../../model/post_model.dart';

abstract class PostState {
  const PostState();
}

class PostInitial extends PostState {
  const PostInitial();
}

class PostLoading extends PostState {
  const PostLoading();
}

class PostCompleted extends PostState {
  final List<dynamic> response;

  PostCompleted(this.response);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is PostCompleted && listEquals(o.response, response);
  }

  @override
  int get hashCode => response.hashCode;
}

class PostError extends PostState {
  final String message;
  const PostError(this.message);
}
