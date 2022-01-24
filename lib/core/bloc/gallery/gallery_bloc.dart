import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../model/gallery_model.dart';
import '../../service/photo_service.dart';

part 'gallery_event.dart';
part 'gallery_state.dart';

class GalleryBloc extends Bloc<GalleryEvent, GalleryState> {
  final PhotoService _photoService;
  GalleryBloc(this._photoService) : super(GalleryInitial()) {
    on<GetPhotos>((event, emit) async {
      try {
        emit(GalleryLoading());
        List<GalleryModel>? photos = await _photoService.getPhotos();
        emit(GalleryLoaded(photos!));
      } catch (e) {
        emit(GalleryError("Error at GalleryBloc"));
      }
    });
  }
}
