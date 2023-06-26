import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';

class ProfileCounter extends StatelessWidget {
  ProfileCounter({Key? key, required this.title, required this.counter}) : super(key: key);

  late String title;
  late int counter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: defaultTextStyle,
        ),
        Text(
          counter.toString(),
          style: defaultTextStyle,
        ),
      ],
    );
  }
}
