import 'package:flutter/material.dart';
import '../../constants.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appPrimaryColour,
      body: Center(
        child: Text(
          "Search Page",
          style: defaultTextStyle,
        ),
      ),
    );
  }
}
