import 'package:flutter/material.dart';

class NameListScreen extends StatelessWidget {
  const NameListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // List of names
    final List<String> names = [
      "Harshil",
      "Rahul",
      "Amit",
      "Neha",
      "Priya",
      "Rohan",
      "Sneha",
      "Karan",
      "Anjali",
      "Vikas"
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Name List"),
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(names[index]),
            onTap: () {
              print("${names[index]} tapped");
            },
          );
        },
      ),
    );
  }
}