// signup_page.dart

import 'package:flutter/material.dart';
import 'signup_service.dart';
import 'login_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  SignupService service = SignupService();

  signupUser() async {
    String result = await service.signupUser(
      email: email.text.trim(),
      password: password.text.trim(),
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(result)),
    );

    if (result == "Success") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 30),

            TextField(
              controller: email,
              decoration: InputDecoration(
                hintText: "Enter Email",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: password,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter Password",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                signupUser();
              },
              child: Text("Signup"),
            ),
          ],
        ),
      ),
    );
  }
}