import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  const PostTile({Key? key, required this.content}) : super(key: key);

  final String content;

  @override
  Widget build(BuildContext context) {
    return Card(
      key: UniqueKey(),
      child: GridTile(
        child: Center(
          child: Text(content),
        ),
      ),
    );
  }
}
