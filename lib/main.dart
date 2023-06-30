import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/LandingPage/landing_page.dart';
import 'package:instagram_clone/constants.dart';
import 'package:instagram_clone/providers/Profile/user_data.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserData(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: appSecondaryColour),
        useMaterial3: true,
      ),
      home: LandingPage(),
    );
  }
}