import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome!', // Or display the user's name here
              style: TextStyle(fontSize: 24),
            ),
            // Add other widgets to your home screen as needed
          ],
        ),
      ),
    );
  }
}