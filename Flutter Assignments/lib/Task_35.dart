import 'package:flutter/material.dart';

class PulsingButtonScreen extends StatefulWidget {
  const PulsingButtonScreen({super.key});

  @override
  State<PulsingButtonScreen> createState() => _PulsingButtonScreenState();
}

class _PulsingButtonScreenState extends State<PulsingButtonScreen> {

  bool isBig = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pulsing Button"),
      ),
      body: Center(
        child: TweenAnimationBuilder<double>(
          tween: Tween<double>(
            begin: 1.0,
            end: isBig ? 1.2 : 1.0,
          ),
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
          onEnd: () {
            // 🔁 loop animation
            setState(() {
              isBig = !isBig;
            });
          },
          builder: (context, scale, child) {
            return Transform.scale(
              scale: scale,
              child: child,
            );
          },

          // Button UI
          child: ElevatedButton(
            onPressed: () {
              print("Button Clicked");
            },
            child: const Text("Pulse"),
          ),
        ),
      ),
    );
  }
}