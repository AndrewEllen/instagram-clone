import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/LandingPage/landing_page.dart';
import 'package:instagram_clone/pages/Login/user_login_page.dart';
import 'package:instagram_clone/pages/UserRegistration/user_registration_email_signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LandingPage(),
    );
  }
}