import 'package:flutter/material.dart';


class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
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
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "$count",
          style: const TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: decrement,
            heroTag: "btn1",
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 15),
          FloatingActionButton(
            onPressed: increment,
            heroTag: "btn2",
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

