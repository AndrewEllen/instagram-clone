import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';
import 'package:instagram_clone/widgets/MainAppWidgets/FavouriteButton.dart';
import '../MainAppWidgets/CommentButton.dart';
import '../MainAppWidgets/LikeButton.dart';
import '../MainAppWidgets/ShareButton.dart';

class HomeFeedPostCard extends StatefulWidget {
  const HomeFeedPostCard({Key? key}) : super(key: key);

  @override
  State<HomeFeedPostCard> createState() => _HomeFeedPostCardState();
}

class _HomeFeedPostCardState extends State<HomeFeedPostCard> {
  late String userName = "Username";
  late String location = "Location";

  late final bool _liked = false;
  late final bool _favourited = false;

  late final int likeCounter = 10;
  late final int commentCounter = 3;

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
        margin: const EdgeInsets.only(left: 10, right: 10),
        color: appPrimaryColour,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                left: 6.0,
              ),
              child: Row(
                children: [
                  LikeButton(
                    liked: _liked,
                  ),
                  CommentButton(),
                  ShareButton(),
                  const Spacer(),
                  FavouriteButton(
                    favourited: _favourited,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "$likeCounter likes",
                style: defaultTextStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: RichText(
                text: TextSpan(
                    text: userName,
                    style: defaultTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: " Post description will go here.",
                        style: defaultTextStyle,
                      )
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                bottom: 12,
              ),
              child: Text(
                "View all $commentCounter comments",
                style: defaultTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
