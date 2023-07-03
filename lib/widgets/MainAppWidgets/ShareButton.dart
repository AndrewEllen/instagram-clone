import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../constants.dart';
import '../HomeWidgets/ShareModalScreen.dart';

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
