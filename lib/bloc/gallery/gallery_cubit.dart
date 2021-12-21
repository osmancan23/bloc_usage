import 'package:bloc_usage/bloc/gallery/gallery_state.dart';
import 'package:bloc_usage/manager/network_manager.dart';
import 'package:bloc_usage/model/gallery_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryCubit extends Cubit<GalleryState> {
  NetworkManager networkManager;
  GalleryCubit(this.networkManager) : super(GalleryInitial());

  getGallery() async {
    try {
      emit(GalleryLoading());
      var response = await networkManager.get(pathQuery: "photos", model: GalleryModel());
      print(response);
      //emit(GalleryCompleted(response));
    } on NetworkError catch (e) {
      emit(GalleryError(e.message));
    }
  }
}
