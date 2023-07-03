import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class LikeButton extends StatefulWidget {
  const LikeButton({Key? key, required this.liked}) : super(key: key);

  final bool liked;

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {

  late bool _liked = false;

  @override
  void initState() {

    if (!widget.liked){
      _liked = false;
    } else {
      _liked = true;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => setState(() {
        _liked = !_liked;
      }),
      icon: Icon(
        MdiIcons.heartOutline,
        color: appTertiaryColour,
      ),
      selectedIcon: Icon(
        MdiIcons.heart,
        color: Colors.red,
      ),
      isSelected: _liked,
    );
  }
}
