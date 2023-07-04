import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../widgets/HomeWidgets/home_feed_post_card.dart';
import '../../widgets/MainAppWidgets/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InstagramAppBar(
        title: FractionallySizedBox(
          widthFactor: 0.5,
          child: Image.asset(
            "assets/instaclone.png",
          ),
        ),
      ),
      backgroundColor: appPrimaryColour,
      body: Center(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return HomeFeedPostCard(
              index: index,
            );
          },
        ),
      ),
    );
  }
}
