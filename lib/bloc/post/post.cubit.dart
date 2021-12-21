import 'package:bloc_usage/model/post_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/network_manager.dart';
import 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final NetworkManager networkManager;
  PostCubit(this.networkManager) : super(const PostInitial());

  Future<void> getPosts() async {
    try {
      emit(const PostLoading());
      await Future.delayed(const Duration(milliseconds: 500));
      final response = await networkManager.get(model: PostModel(), pathQuery: "posts");
      print(response.toString());
      emit(PostCompleted(response!));
    } on NetworkError catch (e) {
      emit(PostError(e.message));
    }
  }
}
