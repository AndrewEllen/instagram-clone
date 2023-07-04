import 'package:flutter/material.dart';
import '../../constants.dart';
import '../HomeWidgets/share_modal_screen.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet(
          showDragHandle: true,
          isScrollControlled: true,
          context: context,
          builder: (BuildContext context) {
            return ShareModalScreen();
          },
        );
      },
      icon: Icon(
        Icons.share_outlined,
        color: appTertiaryColour,
      ),
    );
  }
}
