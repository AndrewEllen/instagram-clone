import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/Home/home_page.dart';
import 'package:instagram_clone/pages/LandingPage/landing_page.dart';
import 'package:instagram_clone/pages/NewPost/new_post_page.dart';
import 'package:instagram_clone/pages/Profile/profile_page.dart';
import 'package:instagram_clone/pages/Search/search_page.dart';
import 'package:instagram_clone/pages/UserRegistration/user_registration_confirmation_email.dart';
import 'package:instagram_clone/widgets/MainAppWidgets/nav_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../providers/Profile/user_data.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;
  late bool _isUserEmailVerified = false;

  List<NavigationDestination> destinationIconsList = [
    NavigationDestination(
      icon: Icon(
        Icons.home_outlined,
        color: appTertiaryColour,
      ),
      label: "Home",
      selectedIcon: Icon(
        Icons.home,
        color: appTertiaryColour,
      ),
    ),
    NavigationDestination(
      icon: Icon(
        Icons.search,
        color: appTertiaryColour,
      ),
      label: "Search",
    ),
    NavigationDestination(
      icon: Icon(
        Icons.add_box_outlined,
        color: appTertiaryColour,
      ),
      label: "New Post",
      selectedIcon: Icon(
        Icons.add_box,
        color: appTertiaryColour,
      ),
    ),
    NavigationDestination(
      icon: Icon(
        Icons.person_outline,
        color: appTertiaryColour,
      ),
      label: "Account",
      selectedIcon: Icon(
        Icons.person,
        color: appTertiaryColour,
      ),
    ),
  ];

  List<Widget> destinationsList = [
    const HomePage(),
    const SearchPage(),
    const NewPostPage(),
    const ProfilePage(),
  ];

  void pageChange(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  void checkUserVerificationStatus() {
    _isUserEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
  }

  void setUserNameForSession() {
    if (FirebaseAuth.instance.currentUser!.displayName != null) {
      context.read<UserData>().updateUserDisplayName(FirebaseAuth.instance.currentUser!.displayName!);
    }
  }

  @override
  void initState() {
    if (FirebaseAuth.instance.currentUser != null) {
      checkUserVerificationStatus();
    }
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        //Returns a different page depending on if a user is logged in or not
        if (snapshot.hasData) {
          checkUserVerificationStatus();
          setUserNameForSession();
          return _isUserEmailVerified ? Scaffold(
            backgroundColor: appPrimaryColour,
            bottomNavigationBar: NavBar(
              destinationsIconList: destinationIconsList,
              pageIndex: pageIndex,
              pageChaneCallback: pageChange,
            ),
            body: destinationsList[pageIndex],
          ) : const UserRegistrationConfirmationEmail();
        } else {
          //resetting pageindex if user logs out
          pageIndex = 0;
          return LandingPage();
        }
      },
    );
  }
}

//
