import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/Login/user_login_page.dart';

import '../UserRegistration/user_registration_confirmation_email.dart';

void main() {
  runApp(LandingPage());
}

class LandingPage extends StatelessWidget {
  LandingPage({super.key});

  final emailController = TextEditingController();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();

  final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> userNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> phoneKey = GlobalKey<FormState>();

  Future<void> sendVerificationEmail(BuildContext context) async {
    final user = FirebaseAuth.instance.currentUser!;
    await user.sendEmailVerification();
    if (context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const UserRegistrationConfirmationEmail(),
        ),
      );
    }
  }

  Future<void> signUpUser(BuildContext context) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );


    if (FirebaseAuth.instance.currentUser != null) {

      FirebaseAuth.instance.currentUser!.updateDisplayName(userNameController.text.trim());
      ///Phone numbers need verified
      //FirebaseAuth.instance.currentUser!.updatePhoneNumber(phoneController.text.trim() as PhoneAuthCredential);

      if (context.mounted) {
        sendVerificationEmail(context);
      }
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Instagram Clone',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30.0),

                ///Needs Verification
                TextFormField(
                  key: emailKey,
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 20.0),

                ///Needs Verification
                TextFormField(
                  key: phoneKey,
                  controller: phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Phone Number',
                  ),
                ),
                const SizedBox(height: 20.0),

                TextFormField(
                  key: userNameKey,
                  controller: userNameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                  ),
                ),
                const SizedBox(height: 20.0),

                TextFormField(
                  key: passwordKey,
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                  ),
                ),
                const SizedBox(height: 30.0),
                ElevatedButton(
                  onPressed: () => signUpUser(context),
                  child: const Text('Signup'),
                ),
                TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(

                        ),
                      ),
                    ),
                    child: const Text(
                      "Login"
                    ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
