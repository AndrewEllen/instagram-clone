import 'package:flutter/material.dart';

class EnterConfirmationPage extends StatelessWidget {
  final String phoneNumber;

  const EnterConfirmationPage({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
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
            const SizedBox(height: 8),
            Text(
              'We have sent a confirmation code to +$phoneNumber. Please enter the code below to continue.',
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            // TODO: Add code input field
            // TODO: --> continue button
          ],
        ),
      ),
    );
  }
}
