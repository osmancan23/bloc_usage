part of 'gallery_bloc.dart';

@immutable
abstract class GalleryState extends Equatable {}

class GalleryInitial extends GalleryState {
  @override
  List<Object?> get props => [];
}

class GalleryLoading extends GalleryState {
  @override
  List<Object?> get props => [];
}

class GalleryLoaded extends GalleryState {
  final List<GalleryModel> photos;

  GalleryLoaded(this.photos);
  @override
  List<Object?> get props => [photos];
}

class GalleryError extends GalleryState {
  final String message;

  GalleryError(this.message);
  @override
  List<Object?> get props => [message];
}
