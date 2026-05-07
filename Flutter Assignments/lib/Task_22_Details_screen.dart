import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Receive data
    final String message =
    ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Screen"),
      ),
      body: Center(
        child: Text(
          message,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}