import '../core/bloc/gallery/gallery_bloc.dart';
import '../core/service/photo_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryView extends StatefulWidget {
  const GalleryView({Key? key}) : super(key: key);

  @override
  State<GalleryView> createState() => _GalleryViewState();
}

class _GalleryViewState extends State<GalleryView> {
  late final GalleryBloc _galleryBloc;
  @override
  void initState() {
    _galleryBloc = GalleryBloc(PhotoService());
    _galleryBloc.add(GetPhotos());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GalleryBloc>(
      create: (context) => _galleryBloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Gallery"),
        ),
        body: BlocConsumer<GalleryBloc, GalleryState>(
          bloc: _galleryBloc,
          listener: (context, state) {
            if (state is GalleryError) {
              ScaffoldMessenger(child: SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is GalleryLoading) {
              return _buildLoadingWidget();
            } else if (state is GalleryLoaded) {
              return buildListViewGallery(state);
            } else if (state is GalleryError) {
              return buildError(state);
            } else {
              return Center(
                child: Text("Inıtıal"),
              );
            }
          },
        ),
      ),
    );
  }

  ListView buildListViewGallery(GalleryLoaded state) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Image.network(state.photos[index].url!),
        subtitle: Text(state.photos[index].title!),
      ),
      itemCount: state.photos.length,
    );
  }

  Center _buildLoadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Text buildError(GalleryState state) {
    final error = state as GalleryError;
    return Text(error.message);
  }
}
