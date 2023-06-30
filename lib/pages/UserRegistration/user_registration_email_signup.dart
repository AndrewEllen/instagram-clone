/*
Under normal circumstances I wouldn't comment such obvious code, but due
to being new to Flutter and wanting to make sure I understand what is going on,
and being able to refer back to the code later on, I have left comments so
I don't forget.

-Lewis
 */

import 'package:flutter/material.dart';
import 'user_registration_confirmation_email.dart';
import '../../extensions/EmailValidator.dart';

class UserRegistrationEmailSignup extends StatelessWidget {
  final _emailController = TextEditingController();

  final GlobalKey<FormState> validatorKey = GlobalKey<FormState>();

  UserRegistrationEmailSignup({Key? key}) : super(key: key);
  // The UserRegistrationEmailSignup class is a stateless widget that represents
  // the page for user email signup. It initializes a TextEditingController for
  // the email input field.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Enter your email address',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30.0),  // Adds vertical spacing
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: validatorKey,
              controller: _emailController,  // Associates the text field with the email controller
              keyboardType: TextInputType.emailAddress,  // Sets the keyboard type to email address
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.grey),  // Sets the color of the input field label
                border: OutlineInputBorder(),  // Adds an outline border to the input field
              ),
              validator: (value) => value!.isValidEmail() ? null : "Invalid Email",
            ),
            const SizedBox(height: 30.0),  // Adds vertical spacing
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserRegistrationConfirmationEmail(
                        email: _emailController.text,
                      ),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),  // Sets the background color of the button
                ),
                child: const Text('Next'),  // Displays the text on the button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
