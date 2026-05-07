import 'package:flutter/material.dart';
import 'Task_36_second_screen.dart';

class Task36FirstScreen extends StatefulWidget {
  const Task36FirstScreen({super.key});

  @override
  State<Task36FirstScreen> createState() => _Task36FirstScreenState();
}

class _Task36FirstScreenState extends State<Task36FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("First Screen"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                const Task36SecondScreen(),

                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {

                  // Slide from right → left
                  const begin = Offset(1.0, 0.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  var offsetAnimation = animation.drive(tween);

                  return SlideTransition(
                    position: offsetAnimation,
                    child: child,
                  );
                },
              ),
            );
          },
          child: const Text("Go to Second Screen"),
        ),
      ),
    );;
  }
}

