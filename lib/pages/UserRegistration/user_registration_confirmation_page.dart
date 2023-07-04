/*
Under normal circumstances I wouldn't comment such obvious code, but due
to being new to Flutter and wanting to make sure I understand what is going on,
and being able to refer back to the code later on, I have left comments so
I don't forget.

-Lewis
 */

import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/Login/user_login_page.dart';

class EnterConfirmationPage extends StatelessWidget {
  final String phoneNumber;

  const EnterConfirmationPage({Key? key, required this.phoneNumber}) : super(key: key);
  /* The EnterConfirmationPage class is a stateless widget that represents the page
   for entering the 'confirmation code'. It takes a phoneNumber parameter which is
   required and is used to display the phone number in the message to the user (this
   will be changed later on). The key parameter is passed to the super constructor
   to provide a unique identifier for this 'widget instance'.
   */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // This will replace the current page with UserLoginPage
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Enter confirmation code',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),  // Adds vertical spacing
            Text(
              'We have sent a confirmation code to +$phoneNumber. Please enter the code below to continue.',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),  // Adds vertical spacing
            // TODO: Add code input field
            // TODO: Add continue button
          ],
        ),
      ),
    );
  }
}
