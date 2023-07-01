import 'package:flutter/material.dart';
import '../../constants.dart';

class BottomModalShareTile extends StatelessWidget {
  const BottomModalShareTile({Key? key, required this.onTap, required this.icon, required this.label}) : super(key: key);

  final Icon icon;
  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: appTertiaryColour,
              )
          ),
          child: IconButton(
            onPressed: onTap,
            icon: icon,
          ),
        ),
        Text(
          label,
          style: defaultTextStyle.copyWith(
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}