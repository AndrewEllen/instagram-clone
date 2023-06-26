import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/ProfileWidgets/profile_counters.dart';
import '../../constants.dart';
import '../../widgets/MainAppWidgets/app_bar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final double profileHeaderBoxSize = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appPrimaryColour,
      appBar: const InstagramAppBar(
        title: Text(
          "Profile",
        ),
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 20,
              left: 30,
            ),
            height: profileHeaderBoxSize,
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: appTertiaryColour,
                    ),
                  ),
                  child: Icon(
                    Icons.person,
                    size: profileHeaderBoxSize,
                  ),
                ),
                const Spacer(),
                ProfileCounter(
                  title: "Posts",
                  //TODO Replace counter value with a provider variable
                  counter: 0,
                ),
                const Spacer(),
                ProfileCounter(
                  title: "Followers",
                  //TODO Replace counter value with a provider variable
                  counter: 0,
                ),
                const Spacer(),
                ProfileCounter(
                  title: "Following",
                  //TODO Replace counter value with a provider variable
                  counter: 0,
                ),
                const Spacer(),
              ],
            ),
          )
        ],
      )
    );
  }
}
