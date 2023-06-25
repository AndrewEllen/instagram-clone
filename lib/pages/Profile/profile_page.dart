import 'package:flutter/material.dart';
import '../../constants.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimaryColour,
      body: Center(
        child: Text(
          "Profile Page",
          style: defaultTextStyle,
        ),
      ),
    );
  }
}
