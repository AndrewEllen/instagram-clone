import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../widgets/HomeWidgets/HomeFeedPostCard.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimaryColour,
      body: Center(
        child: HomeFeedPostCard(),
      ),
    );
  }
}
