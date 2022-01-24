import 'core/bloc/gallery/gallery_bloc.dart';
import 'core/service/photo_service.dart';
import 'view/gallery_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<GalleryBloc>(
            create: (BuildContext context) => GalleryBloc(
                  PhotoService(),
                )),
      ],
      child: MaterialApp(
        home: GalleryView(),
      ),
    ),
  );
}
