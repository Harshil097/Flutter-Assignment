import 'package:flutter/material.dart';

class SimpleCalculatorScreen extends StatefulWidget {
  const SimpleCalculatorScreen({super.key});

  @override
  State<SimpleCalculatorScreen> createState() => _SimpleCalculatorScreenState();
}

class _SimpleCalculatorScreenState extends State<SimpleCalculatorScreen> {

  String display = "0";

  void onButtonPressed(String value) {
    setState(() {
      if (display == "0") {
        display = value;
      } else {
        display += value;
      }
    });
  }

  void clear() {
    setState(() {
      display = "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ),
      body: Column(
        children: [

          // Display
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(20),
            child: Text(
              display,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
          ),

          // Buttons Grid
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children: [

                // Row 1
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
                buildButton("/"),

                // Row 2
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
                buildButton("*"),

                // Row 3
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
                buildButton("-"),

                // Row 4
                buildButton("0"),
                buildButton("C"),
                buildButton("="),
                buildButton("+"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildButton(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          if (text == "C") {
            clear();
          } else if (text == "=") {
            // Simple eval (basic)
            try {
              final result = _calculate(display);
              setState(() {
                display = result.toString();
              });
            } catch (e) {
              setState(() {
                display = "Error";
              });
            }
          } else {
            onButtonPressed(text);
          }
        },
        child: Text(
          text,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  // Basic calculation logic
  double _calculate(String input) {
    // NOTE: Ye simple demo hai (sirf + - * / basic handle karega)
    final parts = input.split(RegExp(r'([\+\-\*/])'));
    if (parts.length < 3) return double.parse(input);

    double num1 = double.parse(parts[0]);
    String op = input.replaceAll(RegExp(r'[0-9.]'), '')[0];
    double num2 = double.parse(parts[1]);

    switch (op) {
      case '+':
        return num1 + num2;
      case '-':
        return num1 - num2;
      case '*':
        return num1 * num2;
      case '/':
        return num1 / num2;
      default:
        return 0;
    }
  }
}