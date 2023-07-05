import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/constants.dart';
import 'package:instagram_clone/extensions/email_validator.dart';
import 'package:instagram_clone/extensions/phone_validator.dart';
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

  final GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  final GlobalKey<FormState> userNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: appSecondaryColour,
                      )
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        )
                    ),
                  ),
                  validator: (value) {
                    if (!value!.isValidEmail() && value!.isNotEmpty) {
                      return "Invalid Email";
                    }
                  },
                ),
                const SizedBox(height: 20.0),

                TextFormField(
                  key: userNameKey,
                  controller: userNameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: appSecondaryColour,
                        )
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        )
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),

                TextFormField(
                  key: passwordKey,
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: appSecondaryColour,
                        )
                    ),
                    focusedErrorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        )
                    ),
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
