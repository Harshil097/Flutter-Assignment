import 'package:flutter/material.dart';

class ImageOverlayScreen extends StatelessWidget {
  const ImageOverlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Overlay"),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [

            // Background Image
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                "https://picsum.photos/400",
                height: 250,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),

            // Transparent Overlay
            Container(
              height: 250,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.4), // 👈 transparency
                borderRadius: BorderRadius.circular(15),
              ),
            ),

            // Center Text
            const Text(
              "Hello Flutter 👋",
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}