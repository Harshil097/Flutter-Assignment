import 'package:flutter/material.dart';

class TextStyleDemo extends StatelessWidget {
  const TextStyleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Styling Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Hello, Flutter!',
              style: TextStyle(
                fontSize: 28,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Explore Text Styles',
              style: TextStyle(
                fontSize: 20,
                color: Colors.red,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}