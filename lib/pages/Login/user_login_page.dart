/*
Under normal circumstances I wouldn't comment such obvious code, but due
to being new to Flutter and wanting to make sure I understand what is going on,
and being able to refer back to the code later on, I have left comments so
I don't forget.

-Lewis
 */

import 'package:flutter/material.dart';
import 'package:instagram_clone/extensions/email_validator.dart';
import 'package:instagram_clone/pages/UserRegistration/user_registration_page.dart';
import 'package:instagram_clone/pages/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  final GlobalKey<FormState> userNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

  Future<void> signInUser(BuildContext context) async {
    //Uses this method if the username is an email
    if (userNameController.text.isValidEmail()) {
      print("signing in");

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        //Trim removes any spaces at the beginning and end of the string.
        email: userNameController.text.trim(),
        password: passwordController.text.trim(),
      );

      if (FirebaseAuth.instance.currentUser != null) {
        //Use context.mounted to avoid error message
        //Not entirely sure what the difference it makes is
        if (context.mounted) {
          Navigator.of(context).pop();
        }
      }

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded( // Added Expanded
            child: SingleChildScrollView( // Added SingleChildScrollView
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    const SizedBox(height: 80.0),
                    Image.asset(
                      'assets/logo.png',
                      height: 80.0,
                    ),
                    const SizedBox(height: 40.0),
                    TextFormField(
                      key: userNameKey,
                      controller: userNameController,
                      decoration: const InputDecoration(
                        labelText: 'Username, email address, or mobile number',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      key: passwordKey,
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () async {
                        signInUser(context);
                      },
                      child: const Text('Log In'),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Forgot Password?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 24.0),
                  ],
                ),
              ),
            ),
          ),
          Padding( // This stays at the bottom
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Don\'t have an account?'),
                const SizedBox(width: 4.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignupPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
