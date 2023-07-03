import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';

class ProfileCounter extends StatelessWidget {
  const ProfileCounter({Key? key, required this.title, required this.counter, this.margin = const EdgeInsets.all(0)}) : super(key: key);

  final String title;
  final int counter;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: Column(
        children: [
          Text(
            counter.toString(),
            style: defaultTextStyle.copyWith(
              fontWeight: FontWeight.bold
            ),
          ),
          Text(
            title,
            style: defaultTextStyle,
          ),
        ],
      ),
    );
  }
}
