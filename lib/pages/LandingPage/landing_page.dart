import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:instagram_clone/constants.dart';
import 'package:instagram_clone/extensions/email_validator.dart';
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

  Future<void> signInWithTwitter() async {
    TwitterAuthProvider twitterProvider = TwitterAuthProvider();

      await FirebaseAuth.instance.signInWithProvider(twitterProvider);

  }

  Future<UserCredential> signInWithGoogle() async {

    final GoogleSignInAccount? user = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? auth = await user?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: auth?.accessToken,
      idToken: auth?.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

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
                const SizedBox(height: 80.0),
                Image.asset(
                  'assets/logo.png',
                  height: 80.0,
                ),
                const SizedBox(height: 40.0),
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
                    if (!value!.isValidEmail() && value.isNotEmpty) {
                      return "Invalid Email";
                    }
                    return null;
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
                        builder: (context) => const LoginPage(

                        ),
                      ),
                    ),
                    child: const Text(
                      "Login"
                    ),
                ),
                Row(
                  children: [

                    const Spacer(),

                    Expanded(
                      child: FractionallySizedBox(
                        widthFactor: 3,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: appTertiaryColour,
                                width: 1
                              )
                            )
                          ),
                        ),
                      ),
                    ),

                    const Spacer(),

                    Container(
                      color: appPrimaryColour,
                      padding: const EdgeInsets.only(
                          left:8.0,
                          right:8.0,
                      ),
                      margin: const EdgeInsets.all(8.0),
                      child: Text(
                        "OR",
                        style: defaultTextStyle.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),

                    const Spacer(),

                    Expanded(
                      child: FractionallySizedBox(
                        widthFactor: 3,
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: appTertiaryColour,
                                      width: 1
                                  )
                              )
                          ),
                        ),
                      ),
                    ),

                    const Spacer(),

                  ],
                ),

                //https://developers.google.com/identity/branding-guidelines Branding guidelines

                Center(
                  child: Column(
                    children: [
                      SignInButton(
                        Buttons.Google,
                        text: "Sign in with Google",
                        onPressed: () => signInWithGoogle(),
                      ),
                      SignInButton(
                        Buttons.Twitter,
                        text: "Sign in with Twitter",
                        onPressed: () => signInWithTwitter(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
