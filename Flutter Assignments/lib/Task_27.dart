import 'package:flutter/material.dart';

class CustomListScreen extends StatefulWidget {
  const CustomListScreen({super.key});

  @override
  State<CustomListScreen> createState() => _CustomListScreenState();
}

class _CustomListScreenState extends State<CustomListScreen> {

  List<String> items = [
    "Task 1",
    "Task 2",
    "Task 3",
    "Task 4",
    "Task 5",
  ];

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom List"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(
                Icons.task,
                color: Colors.blue,
              ),

              title: Text(
                items[index],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => deleteItem(index),
              ),
            ),
          );
        },
      ),
    );
  }
}