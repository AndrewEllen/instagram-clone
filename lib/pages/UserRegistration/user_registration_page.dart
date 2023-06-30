import 'package:flutter/material.dart';
import 'user_registration_confirmation_page.dart';
import 'user_registration_email_signup.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);
  // The SignupPage class is a stateful widget that represents the signup page.
  // It initializes a state using SignupPageState as its state class.

  @override
  SignupPageState createState() => SignupPageState();
// Creates an instance of SignupPageState as the state for the SignupPage.
}

class SignupPageState extends State<SignupPage> {
  final _phoneNumberController = TextEditingController();

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }

  void _navigateToEnterConfirmationPage(BuildContext context) {
    String phoneNumber = _phoneNumberController.text;
    if (phoneNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter a phone number.'),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => EnterConfirmationPage(phoneNumber: phoneNumber),
        ),
      );
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
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              "What's your mobile number?",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30.0),  // Adds vertical spacing
            const Text(
              "Enter the mobile number on which you can be contacted. No one will see this on your profile.",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 20.0),  // Adds vertical spacing
            TextField(
              controller: _phoneNumberController,  // Associates the text field with the phone number controller
              keyboardType: TextInputType.phone,  // Sets the keyboard type to phone
              decoration: const InputDecoration(
                labelText: "Mobile number",
                labelStyle: TextStyle(color: Colors.grey),  // Sets the color of the input field label
                border: OutlineInputBorder(),  // Adds an outline border to the input field
              ),
            ),
            const SizedBox(height: 8),  // Adds vertical spacing
            const Text(
              "You may receive SMS notifications from us for security and login purposes.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30.0),  // Adds vertical spacing
            Center(
              child: ElevatedButton(
                onPressed: () => _navigateToEnterConfirmationPage(context),  // Calls the function to navigate to EnterConfirmationPage
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),  // Sets the background color of the button
                ),
                child: const Text("Next"),  // Displays the text on the button
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserRegistrationEmailSignup(),
                    ),
                  );
                },
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.blue),  // Sets the foreground color of the button
                ),
                child: const Text("Sign up with email address"),  // Displays the text on the button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
