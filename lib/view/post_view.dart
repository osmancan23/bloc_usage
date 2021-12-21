import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post/post.cubit.dart';
import '../bloc/post/post_state.dart';
import '../manager/network_manager.dart';

class PostView extends StatelessWidget {
  const PostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostCubit(NetworkManager()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Posts"),
        ),
        body: BlocConsumer<PostCubit, PostState>(
          listener: (context, state) {
            if (state is PostError) {
              ScaffoldMessenger(child: SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is PostInitial) {
              return buildCenterInitialChild(context);
            } else if (state is PostLoading) {
              return buildCenterLoading();
            } else if (state is PostCompleted) {
              return buildListViewCats(state);
            } else {
              return buildError(state);
            }
          },
        ),
      ),
    );
  }

  Text buildError(PostState state) {
    final error = state as PostError;
    return Text(error.message);
  }

  ListView buildListViewCats(PostCompleted state) {
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(state.response[index].title.toString()),
        subtitle: Text(state.response[index].body.toString()),
      ),
      itemCount: state.response.length,
    );
  }

  Center buildCenterLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Center buildCenterInitialChild(BuildContext context) {
    return Center(
      child: Column(
        children: [const Text("Hello"), buildFloatingActionButtonCall(context)],
      ),
    );
  }

  FloatingActionButton buildFloatingActionButtonCall(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.clear_all),
      onPressed: () async {
        await context.read<PostCubit>().getPosts();
      },
    );
  }
}
