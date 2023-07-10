import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:instagram_clone/widgets/ProfileWidgets/bottom_modal_edit_bar.dart';
import 'package:instagram_clone/widgets/ProfileWidgets/profile_counters.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../providers/Profile/user_data.dart';
import '../../widgets/MainAppWidgets/app_bar.dart';
import '../../widgets/ProfileWidgets/bottom_modal_share_bar.dart';
import '../../widgets/MainAppWidgets/bottom_modal_share_tile.dart';
import '../../widgets/ProfileWidgets/posts_grid_view.dart';
import '../../widgets/ProfileWidgets/profile_buttons.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {

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


  Future<void> signOutUser() async {

    if (await GoogleSignIn().isSignedIn()) {
      await GoogleSignIn().disconnect();
    }

    await FirebaseAuth.instance.signOut();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: appPrimaryColour,
      appBar: InstagramAppBar(
        title: Text(
          context.watch<UserData>().userName,
        ),
        actions: [
          IconButton(
            onPressed: () => signOutUser(),
            icon: const Icon(
              Icons.logout,
              color: Colors.red,
            ),
          )
        ],
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
                  Column(
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
                          text: context.watch<UserData>().userDisplayName,
                          style: defaultTextStyle.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: context.watch<UserData>().pronouns.isNotEmpty
                                  ? " ${context.watch<UserData>().pronouns}"
                                  : "",
                              style: defaultTextStyle.copyWith(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 30.0,
                        ),
                        child: Text(
                          context.watch<UserData>().bio,
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const ProfileCounter(
                    title: "Posts",
                    //TODO Replace counter value with a provider variable
                    counter: 0,
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                  ),
                  const Spacer(),
                  const ProfileCounter(
                    title: "Followers",
                    //TODO Replace counter value with a provider variable
                    counter: 0,
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                  ),
                  const Spacer(),
                  const ProfileCounter(
                    title: "Following",
                    //TODO Replace counter value with a provider variable
                    counter: 0,
                    margin: EdgeInsets.only(
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
                    onTap: () {
                      showModalBottomSheet(
                        showDragHandle: true,
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext context) {
                          return const BottomModalEditBar();
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: ProfileButton(
                    text: "Share Profile",
                    onTap: () {
                      showModalBottomSheet(
                        showDragHandle: true,
                        context: context,
                        builder: (BuildContext context) {
                          return BottomModalShareBar(
                            modalTileList: [
                              BottomModalShareTile(
                                icon: const Icon(
                                  Icons.discord,
                                ),
                                onTap: () {},
                                label: "Discord",
                              ),
                              BottomModalShareTile(
                                icon: Icon(
                                  MdiIcons.twitter,
                                ),
                                onTap: () {},
                                label: "Twitter",
                              ),
                              BottomModalShareTile(
                                icon: const Icon(
                                  Icons.facebook,
                                ),
                                onTap: () {},
                                label: "Facebook",
                              ),
                              BottomModalShareTile(
                                icon: Icon(
                                  MdiIcons.instagram,
                                ),
                                onTap: () {},
                                label: "Instagram",
                              ),
                              BottomModalShareTile(
                                icon: Icon(
                                  MdiIcons.whatsapp,
                                ),
                                onTap: () {},
                                label: "Whatsapp",
                              ),
                              BottomModalShareTile(
                                icon: Icon(
                                  MdiIcons.facebookMessenger,
                                ),
                                onTap: () {},
                                label: "Messenger",
                              ),
                              BottomModalShareTile(
                                icon: const Icon(
                                  Icons.messenger,
                                ),
                                onTap: () {},
                                label: "SMS",
                              ),
                              BottomModalShareTile(
                                icon: const Icon(
                                  Icons.email,
                                ),
                                onTap: () {},
                                label: "Email",
                              ),
                              BottomModalShareTile(
                                icon: const Icon(
                                  Icons.link,
                                ),
                                onTap: () {},
                                label: "Copy",
                              ),
                            ],
                          );
                        },
                      );
                    },
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
                        icon: Icon(Icons.border_all),
                      ),
                      Tab(
                        icon: Icon(Icons.video_library_outlined),
                      ),
                      Tab(
                        icon: Icon(Icons.person_pin_outlined),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 450,
                  child: TabBarView(
                    controller: tabController,
                      children: const [
                        PostsGridView(
                          length: 25,
                        ),
                        PostsGridView(
                          length: 13,
                      ),
                        PostsGridView(
                          length: 6,
                      ),
                    ],
                  ),
                  )
              ],
            ),
          ),
        ],
        ));
  }
}
