import 'package:flutter/material.dart';
import 'BottomModalShareTile.dart';

class BottomModalShareBar extends StatelessWidget {
  const BottomModalShareBar({Key? key, required this.modalTileList}) : super(key: key);

  final List<BottomModalShareTile> modalTileList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: modalTileList,
      ),
    );
  }
}