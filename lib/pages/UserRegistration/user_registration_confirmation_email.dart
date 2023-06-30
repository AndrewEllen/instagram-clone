/*
Under normal circumstances I wouldn't comment such obvious code, but due
to being new to flutter and wanting to make sure I understand what is going on,
and being able to refer back to the code later on, I have left comments so
I don't forget

-Lewis
 */

import 'package:flutter/material.dart';

class UserRegistrationConfirmationEmail extends StatelessWidget {
  final String email;

  // Constructor to initialize the email parameter
  const UserRegistrationConfirmationEmail({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Scaffold widget provides a basic structure for the app screen
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Navigates back when the back arrow button is pressed
        ),
        backgroundColor: Colors.white, // Sets the background color of the app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Enter confirmation code',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30.0),
            Text(
              'We have sent a confirmation code to $email. Please enter the code below to continue.',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 30.0),
            const TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Confirmation code', // Placeholder text for the input field
                labelStyle: TextStyle(color: Colors.grey), // Sets the color of the placeholder text
                border: OutlineInputBorder(), // Adds a border around the input field
              ),
            ),
            const SizedBox(height: 30.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Add functionality to 'continue'
                  // This function will be called when the button is pressed
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue), // Sets the background color of the button
                ),
                child: const Text('Continue'), // Text displayed on the button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
