import 'package:flutter/material.dart';

class FeedbackFormScreen extends StatefulWidget {
  const FeedbackFormScreen({super.key});

  @override
  State<FeedbackFormScreen> createState() => _FeedbackFormScreenState();
}

class _FeedbackFormScreenState extends State<FeedbackFormScreen> {

  final nameController = TextEditingController();
  final commentController = TextEditingController();

  String selectedCategory = "General";

  final List<String> categories = [
    "General",
    "Bug Report",
    "Feature Request",
    "Other"
  ];

  void submitFeedback() {
    print("Name: ${nameController.text}");
    print("Category: $selectedCategory");
    print("Comment: ${commentController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Feedback Form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // Name Field
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Your Name",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // Dropdown
            DropdownButtonFormField(
              value: selectedCategory,
              items: categories.map((category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
              decoration: const InputDecoration(
                labelText: "Select Category",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            // Comment Field
            TextField(
              controller: commentController,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: "Comments",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 25),

            // Submit Button
            ElevatedButton(
              onPressed: submitFeedback,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Submit Feedback"),
            )
          ],
        ),
      ),
    );
  }
}