import 'package:bloc_usage/bloc/gallery/gallery_cubit.dart';
import 'package:bloc_usage/bloc/gallery/gallery_state.dart';
import 'package:bloc_usage/manager/network_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GalleryView extends StatelessWidget {
  const GalleryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GalleryCubit(NetworkManager()),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Gallery"),
        ),
        body: BlocConsumer<GalleryCubit, GalleryState>(
          bloc: GalleryCubit(NetworkManager()),
          listener: (context, state) {
            if (state is GalleryError) {
              ScaffoldMessenger(child: SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is GalleryInitial) {
              return Center(
                child: Column(
                  children: [const Text("Hello"), buildFloatingActionButtonCall(context)],
                ),
              );
            } else if (state is GalleryLoading) {
              return _buildLoadingWidget();
            } else if (state is GalleryCompleted) {
              return buildListViewGallery(state);
            } else {
              return buildError(state);
            }
          },
        ),
      ),
    );
  }

  ListView buildListViewGallery(GalleryCompleted state) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Image.network(state.response[index].url!),
        subtitle: Text(state.response[index].title!),
      ),
      itemCount: state.response.length,
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

  FloatingActionButton buildFloatingActionButtonCall(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async {
        await context.read<GalleryCubit>().getGallery();
      },
    );
  }
}
