import 'package:flutter/material.dart';
import 'post_tile.dart';

class PostsGridView extends StatelessWidget {
  const PostsGridView({Key? key, required this.length}) : super(key: key);

  final int length;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (BuildContext context, int index) {
        return PostTile(
          content: index.toString(),
        );
      },
    );
  }
}
