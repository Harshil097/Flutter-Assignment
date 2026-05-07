import 'package:flutter/material.dart';

class CounterAppScreen extends StatefulWidget {
  const CounterAppScreen({super.key});

  @override
  State<CounterAppScreen> createState() => _CounterAppScreenState();
}

class _CounterAppScreenState extends State<CounterAppScreen> {

  int count = 0;

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Display Count
            Text(
              "$count",
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            // Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                // Decrement Button
                ElevatedButton(
                  onPressed: decrement,
                  child: const Text("-"),
                ),

                const SizedBox(width: 20),

                // Increment Button
                ElevatedButton(
                  onPressed: increment,
                  child: const Text("+"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}