import 'package:flutter/material.dart';
import 'PostTile.dart';

class PostsGridView extends StatelessWidget {
  PostsGridView({Key? key, required this.length}) : super(key: key);

  late int length;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        itemCount: length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return PostTile(
            content: index.toString(),
          );
        },
      )
    );
  }
}
