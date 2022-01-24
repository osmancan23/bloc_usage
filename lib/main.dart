import 'package:bloc_usage/core/bloc/gallery/gallery_bloc.dart';
import 'package:bloc_usage/core/service/photo_service.dart';
import 'package:bloc_usage/view/gallery_view.dart';
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
