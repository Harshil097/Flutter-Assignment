import 'package:flutter/material.dart';

class Task36SecondScreen extends StatefulWidget {
  const Task36SecondScreen({super.key});

  @override
  State<Task36SecondScreen> createState() => _Task36SecondScreenState();
}

class _Task36SecondScreenState extends State<Task36SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
      ),
      body: const Center(
        child: Text(
          "Slide Animation Screen 🚀",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );;
  }
}
