/*
Under normal circumstances I wouldn't comment such obvious code, but due
to being new to flutter and wanting to make sure I understand what is going on,
and being able to refer back to the code later on, I have left comments so
I don't forget

-Lewis
 */

import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/UserRegistration/user_registration_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,  // Aligns the child widgets to the center of the container
        padding: const EdgeInsets.symmetric(horizontal: 24.0),  // Sets horizontal padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Distributes child widgets evenly along the vertical axis
          crossAxisAlignment: CrossAxisAlignment.stretch,  // Stretches child widgets to fill the horizontal space
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,  // Aligns child widgets to the center vertically
              children: <Widget>[
                const SizedBox(height: 80.0),  // Adds vertical spacing
                // Image.asset(
                //   '../../assets/logo.png', can't seem to get this working
                //   height: 80.0,
                // ),
                const SizedBox(height: 40.0),  // Adds vertical spacing
                const TextField(
                  decoration: InputDecoration(
                    labelText: 'Username, email address, or mobile number',  // Adds a label to the text field
                  ),
                ),
                const SizedBox(height: 16.0),  // Adds vertical spacing
                const TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',  // Adds a label to the text field
                  ),
                ),
                const SizedBox(height: 16.0),  // Adds vertical spacing
                ElevatedButton(
                  onPressed: () {},  // Defines the function to be executed when the button is pressed
                  child: const Text('Log In'),  // Displays the text on the button
                ),
                const SizedBox(height: 16.0),  // Adds vertical spacing
                const Text(
                  'Forgot Password?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,  // Sets the color of the text
                    fontWeight: FontWeight.w600,  // Sets the font weight of the text
                  ),
                ),
                const SizedBox(height: 24.0),  // Adds vertical spacing
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,  // Aligns child widgets to the center horizontally
                children: <Widget>[
                  const Text('Don\'t have an account?'),  // Displays the text
                  const SizedBox(width: 4.0),  // Adds horizontal spacing
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupPage(),  // Navigates to the SignupPage when tapped
                        ),
                      );
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.blue,  // Sets the color of the text
                        fontWeight: FontWeight.w600,  // Sets the font weight of the text
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
