import 'package:flutter/material.dart';

class ResponsiveRowLayoutScreen extends StatelessWidget {
  const ResponsiveRowLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Responsive Row Layout"),
      ),
      body: Row(
        children: [
          Container(
            width: screenWidth * 0.3,
            color: Colors.red,
            child: const Center(child: Text("30%")),
          ),
          Container(
            width: screenWidth * 0.4,
            color: Colors.green,
            child: const Center(child: Text("40%")),
          ),
          Container(
            width: screenWidth * 0.3,
            color: Colors.blue,
            child: const Center(child: Text("30%")),
          ),
        ],
      ),
    );
  }
}