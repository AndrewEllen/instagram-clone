import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class FavouriteButton extends StatefulWidget {
  FavouriteButton({Key? key, required this.favourited}) : super(key: key);

  late bool favourited;

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {

  late bool _favourited = false;

  @override
  void initState() {

    if (!widget.favourited){
      _favourited = false;
    } else {
      _favourited = true;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => setState(() {
        _favourited = !_favourited;
      }),
      icon: Icon(
        MdiIcons.bookmarkOutline,
        color: appTertiaryColour,
      ),
      selectedIcon: Icon(
        MdiIcons.bookmark,
        color: appTertiaryColour,
      ),
      isSelected: _favourited,
    );
  }
}
