import 'package:flutter/material.dart';

class AnimatedExpandScreen extends StatefulWidget {
  const AnimatedExpandScreen({super.key});

  @override
  State<AnimatedExpandScreen> createState() => _AnimatedExpandScreenState();
}

class _AnimatedExpandScreenState extends State<AnimatedExpandScreen> {

  bool isExpanded = false;

  void toggle() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Expand"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Button
            ElevatedButton(
              onPressed: toggle,
              child: Text(isExpanded ? "Collapse" : "Expand"),
            ),

            const SizedBox(height: 20),

            // Animated Container
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              height: isExpanded ? 150 : 0,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),

              // Content inside
              child: isExpanded
                  ? const Center(
                child: Text(
                  "Hello! This is expandable content 🎉",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}