import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';

import 'LikeButton.dart';

class HomeFeedPostCard extends StatefulWidget {
  const HomeFeedPostCard({Key? key}) : super(key: key);

  @override
  State<HomeFeedPostCard> createState() => _HomeFeedPostCardState();
}

class _HomeFeedPostCardState extends State<HomeFeedPostCard> {

  late String userName = "Username";
  late String location = "Location";

  late bool _liked = false;

  final double width = double.maxFinite;

  /// Aspect ratio should be either 1 or 0.8
  late double aspectRatio = 0.8;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: width,
        //maxHeight: 500,
      ),
      //height: 100,
      child: Card(
        margin: const EdgeInsets.only(
          left: 10,
          right: 10
        ),
        color: appPrimaryColour,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: appTertiaryColour,
                      ),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userName,
                      style: defaultTextStyle,
                    ),
                    Text(
                      location,
                      style: defaultTextStyle,
                    ),
                  ],
                ),

              ],
            ),

            AspectRatio(
              /// Sets container height equal to width. Using this because width is equal to the max possible value.
              /// width: double.maxfinite;
              aspectRatio: aspectRatio,
              child: SizedBox(
                width: width,
                child: Container(
                  color: appSecondaryColour,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                top: 6.0,
                bottom: 6.0,
                left: 6.0,
              ),
              child: Row(
                children: [
                  LikeButton(
                    liked: _liked,
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
