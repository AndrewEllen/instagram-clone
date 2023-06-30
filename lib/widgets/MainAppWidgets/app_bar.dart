import 'package:flutter/material.dart';

class InstagramAppBar extends StatefulWidget implements PreferredSizeWidget{
  const InstagramAppBar({Key? key, this.title}) : preferredSize = const Size.fromHeight(kToolbarHeight), super(key: key);

  final Widget? title;

  @override
  final Size preferredSize;

  @override
  State<InstagramAppBar> createState() => _InstagramAppBarState();

}

class _InstagramAppBarState extends State<InstagramAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: widget.title,
    );
  }
}
