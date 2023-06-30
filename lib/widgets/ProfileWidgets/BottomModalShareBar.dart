import 'package:flutter/material.dart';
import 'BottomModalShareTile.dart';

class BottomModalShareBar extends StatelessWidget {
  const BottomModalShareBar({Key? key, required this.modalTileList}) : super(key: key);

  final List<BottomModalShareTile> modalTileList;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.3,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: modalTileList,
      ),
    );
  }
}