import 'package:flutter/material.dart';

class FadeInImageScreen extends StatelessWidget {
  const FadeInImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fade In Image"),
      ),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: FadeInImage.assetNetwork(
            placeholder: "assets/images/placeholder.png", // 👈 local image
            image: "https://picsum.photos/400", // 👈 network image
            height: 250,
            width: 300,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(seconds: 1),
          ),
        ),
      ),
    );
  }
}