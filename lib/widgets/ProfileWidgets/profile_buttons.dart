import 'package:flutter/material.dart';
import '../../constants.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({Key? key, required this.onTap, required this.text}) : super(key: key);

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: onTap,
        child: Text(
          text,
          style: defaultTextStyle,
        ),
      ),
    );
  }
}
