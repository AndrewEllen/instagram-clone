import 'package:flutter/material.dart';

class InstagramAppBar extends StatefulWidget implements PreferredSizeWidget{
  const InstagramAppBar({Key? key, this.title, this.actions}) : preferredSize = const Size.fromHeight(kToolbarHeight), super(key: key);

  final Widget? title;
  final List<Widget>? actions;

  @override
  final Size preferredSize;

  @override
  State<InstagramAppBar> createState() => _InstagramAppBarState();

}

class _InstagramAppBarState extends State<InstagramAppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(left:4.0),
        child: widget.title,
      ),
      actions: widget.actions,
    );
  }
}
