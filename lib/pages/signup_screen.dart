import 'package:flutter/material.dart';
import 'gradient_button.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'), // Change as needed
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                
                  SizedBox(height: 10),
                  Text("Sign Up", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(labelText: "Username", border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder()),
                    obscureText: true,
                  ),
                  SizedBox(height: 10),
                  GradientButton(text: "Sign Up", onPressed: () {}),
                  SizedBox(height: 10),
                  Text("Sign up with"),
                  SizedBox(height: 10),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.g_mobiledata, color: Colors.red),
                    label: Text("Continue with Google"),
                  ),
                  SizedBox(height: 10),
                  Text("Already have an account?"),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Sign In"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
