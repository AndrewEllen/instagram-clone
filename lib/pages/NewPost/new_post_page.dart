import 'package:flutter/material.dart';
import '../../constants.dart';

class NewPostPage extends StatefulWidget {
  const NewPostPage({Key? key}) : super(key: key);

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimaryColour,
      body: Center(
        child: Text(
          "New Post Page",
          style: defaultTextStyle,
        ),
      ),
    );
  }
}
