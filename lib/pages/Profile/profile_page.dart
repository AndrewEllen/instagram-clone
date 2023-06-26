import 'package:flutter/material.dart';
import 'package:instagram_clone/widgets/ProfileWidgets/profile_counters.dart';
import '../../constants.dart';
import '../../widgets/MainAppWidgets/app_bar.dart';
import '../../widgets/ProfileWidgets/profile_buttons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with TickerProviderStateMixin{

  final String userName = "User Name";
  final String pronouns = "He/Him";

  final double profileHeaderBoxSize = 60;

  TabController? tabController;

  @override
  void initState() {

    tabController = TabController(
      length: 3,
      vsync: this,
    );

    super.initState();
  }

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
      body: Column(
        children: [
          Container(
            constraints: BoxConstraints(
              minHeight: profileHeaderBoxSize,
            ),
            margin: const EdgeInsets.only(
              top: 20,
              left: 30,
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    child: Column(
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
                        RichText(
                          text: TextSpan(
                            text: userName,
                            style: defaultTextStyle.copyWith(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: pronouns.isNotEmpty ? " $pronouns" : "",
                                style: defaultTextStyle.copyWith(
                                  fontSize: 12,
                                ),
                            ),
                            ]
                          )
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  ProfileCounter(
                    title: "Posts",
                    //TODO Replace counter value with a provider variable
                    counter: 0,
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                  ),
                  const Spacer(),
                  ProfileCounter(
                    title: "Followers",
                    //TODO Replace counter value with a provider variable
                    counter: 0,
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                  ),
                  const Spacer(),
                  ProfileCounter(
                    title: "Following",
                    //TODO Replace counter value with a provider variable
                    counter: 0,
                    margin: const EdgeInsets.only(
                      top: 10,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 30,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: ProfileButton(
                      text: "Edit Profile",
                      onTap: () {},
                    ),
                  ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: ProfileButton(
                      text: "Share Profile",
                      onTap: () {},
                    ),
                  ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 30,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                  child: TabBar(
                    controller: tabController,
                    indicatorColor: appSecondaryColour,
                    labelColor: appSecondaryColour,
                    unselectedLabelColor: appTertiaryColour,
                    tabs: const [
                      Tab(
                        icon: Icon(
                            Icons.border_all
                        ),
                      ),
                      Tab(
                        icon: Icon(
                            Icons.video_library_outlined
                        ),
                      ),
                      Tab(
                        icon: Icon(
                            Icons.person_pin_outlined
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 200,
                  child: TabBarView(
                    controller: tabController,
                    children: const [
                      Center(
                        child: Text(
                          "Page 1",
                        ),
                      ),
                      Center(
                        child: Text(
                          "Page 2",
                        ),
                      ),
                      Center(
                        child: Text(
                          "Page 3",
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      )
    );
  }
}
