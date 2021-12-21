import 'package:bloc_usage/view/gallery_view.dart';
import 'package:flutter/material.dart';

import 'view/post_view.dart';

void main(List<String> args) {
  runApp(const MyHomePage());
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => PostView()));
                },
                child: Text("Posts"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => GalleryView()));
                },
                child: Text("Gallery"),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
