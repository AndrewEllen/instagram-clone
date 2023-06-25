import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/Home/home_page.dart';
import 'package:instagram_clone/pages/NewPost/new_post_page.dart';
import 'package:instagram_clone/pages/Profile/profile_page.dart';
import 'package:instagram_clone/pages/Search/search_page.dart';
import 'package:instagram_clone/widgets/MainAppWidgets/nav_bar.dart';

import '../constants.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;

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
    HomePage(),
    SearchPage(),
    NewPostPage(),
    ProfilePage(),
  ];

  void PageChange(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimaryColour,
      bottomNavigationBar: NavBar(
        destinationsIconList: destinationIconsList,
        pageIndex: pageIndex,
        pageChaneCallback: PageChange,
      ),
      body: destinationsList[pageIndex],
    );
  }
}