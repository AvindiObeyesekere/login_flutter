import 'package:flutter/material.dart';
import './pages/login_screen.dart';
import './pages/home_screen.dart'; // Import your home screen
import './pages/signup_screen.dart'; // Import your signup screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/login', // Set initial route
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(), // Define the /home route
        '/signup': (context) => const SignUpScreen(), // Define the /signup route
      },
    );
  }
}