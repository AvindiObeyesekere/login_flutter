import 'package:flutter/material.dart';
import 'gradient_button.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
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
                  Text("Sign In",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                      filled: true,
                      fillColor: Colors
                          .white, // Makes the field background solid white
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                        borderSide: BorderSide.none, // No outer border
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 14, horizontal: 16), // Padding inside field
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Password",
                      filled: true,
                      fillColor: Colors
                          .white, // Makes the field background solid white
                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                        borderSide: BorderSide.none, // No outer border
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 14, horizontal: 16), // Padding inside field
                    ),
                    obscureText: true, // Hides text input
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      Text("Remember me"),
                      Spacer(),
                      TextButton(
                          onPressed: () {}, child: Text("Forgot password?"))
                    ],
                  ),
                  SizedBox(height: 10),
                  GradientButton(text: "Sign In", onPressed: () {}),
                  SizedBox(height: 10),
                  Text("Sign in with"),
                  SizedBox(height: 10),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.g_mobiledata, color: Colors.red),
                    label: Text("Continue with Google"),
                  ),
                  SizedBox(height: 10),
                  Text("Don't have an account?"),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpScreen()),
                      );
                    },
                    child: Text("Sign Up"),
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
