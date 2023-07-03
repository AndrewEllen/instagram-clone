import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../MainAppWidgets/BottomModalShareTile.dart';

class CommentModalScreen extends StatelessWidget {
  CommentModalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.96,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
            width: double.maxFinite,
            height: 50,
            child: Center(
              child: Text(
                "Comment $index"
              ),
            ),
          );
        },
      )
    );
  }
}
