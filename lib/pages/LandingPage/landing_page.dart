import 'package:flutter/material.dart';
import 'package:instagram_clone/pages/Login/user_login_page.dart';

void main() {
  runApp(const LandingPage());
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(40.0),
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
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 20.0),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Full Name',
                ),
              ),
              const SizedBox(height: 20.0),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 20.0),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: () {},
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
            ],
          ),
        ),
    );
  }
}
