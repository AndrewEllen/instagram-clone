import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: MyHomePage()));
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram Clone'),
      ),
      body: const Center(
        child: Text(
          'Removed all boilerplate code for a clean start',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
