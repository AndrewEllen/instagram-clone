import 'package:flutter/material.dart';
import '../../constants.dart';

class NavBar extends StatefulWidget {
  NavBar({Key? key, required this.destinationsIconList, required this.pageIndex, required this.pageChaneCallback, this.labelBehavior = NavigationDestinationLabelBehavior.alwaysHide}) : super(key: key);

  late Function pageChaneCallback;
  late int pageIndex;
  late List<NavigationDestination> destinationsIconList;
  late NavigationDestinationLabelBehavior labelBehavior;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: appTertiaryColour,
            width: 0.3,
        ),
        )
      ),
      child: NavigationBar(
        height: 50,
        backgroundColor: appPrimaryColour,
        surfaceTintColor: appPrimaryColour,
        indicatorColor: appPrimaryColour,
        labelBehavior: widget.labelBehavior,
        selectedIndex: widget.pageIndex,
        destinations: widget.destinationsIconList,
        onDestinationSelected: (int index) => widget.pageChaneCallback(index),
      ),
    );
  }
}
