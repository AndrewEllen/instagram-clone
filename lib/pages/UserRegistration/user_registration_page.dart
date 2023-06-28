import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/Login/user_login_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Signup',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignupPage(),
    );
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  SignupPageState createState() => SignupPageState();
}

class SignupPageState extends State<SignupPage> {
  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginPage()),
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
              "What's your mobile number?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Enter the mobile number on which you can be contacted. No one will see this on your profile.",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                labelText: "Mobile number",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "You may receive SMS notifications from us for security and login purposes.",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Add functionality here
                },
                child: const Text("Next"),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  // TODO: Add Functionality
                },
                child: const Text("Sign up with email address"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
