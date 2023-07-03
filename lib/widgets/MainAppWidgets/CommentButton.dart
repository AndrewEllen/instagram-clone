import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';

import '../HomeWidgets/CommentModalScreen.dart';

class CommentButton extends StatelessWidget {
  const CommentButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          showDragHandle: true,
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return const CommentModalScreen();
          },
        );
      },
      icon: Icon(
        Icons.chat_bubble_outline,
        color: appTertiaryColour,
      ),
    );
  }
}
