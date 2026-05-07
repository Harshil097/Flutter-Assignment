import 'package:flutter/material.dart';

class ToggleThemeScreen extends StatefulWidget {
  const ToggleThemeScreen({super.key});

  @override
  State<ToggleThemeScreen> createState() => _ToggleThemeScreenState();
}

class _ToggleThemeScreenState extends State<ToggleThemeScreen> {

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Toggle Background Color"),
      ),

      // Background color change
      backgroundColor: isSwitched ? Colors.black : Colors.white,

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              isSwitched ? "Dark Mode ON" : "Light Mode OFF",
              style: TextStyle(
                fontSize: 18,
                color: isSwitched ? Colors.white : Colors.black,
              ),
            ),

            const SizedBox(height: 20),

            // Switch
            Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}