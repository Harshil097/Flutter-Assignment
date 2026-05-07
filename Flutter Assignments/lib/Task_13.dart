import 'package:flutter/material.dart';

class ImageSwitcherScreen extends StatefulWidget {
  const ImageSwitcherScreen({super.key});

  @override
  State<ImageSwitcherScreen> createState() => _ImageSwitcherScreenState();
}

class _ImageSwitcherScreenState extends State<ImageSwitcherScreen> {

  int index = 0;

  // List of image URLs
  final List<String> images = [
    "https://picsum.photos/300?random=1",
    "https://picsum.photos/300?random=2",
    "https://picsum.photos/300?random=3",
    "https://picsum.photos/300?random=4",
  ];

  void changeImage() {
    setState(() {
      index = (index + 1) % images.length; // loop through images
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Switcher"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // Image from network
            Image.network(
              images[index],
              height: 250,
              width: 250,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),

            // Button
            ElevatedButton(
              onPressed: changeImage,
              child: const Text("Change Image"),
            ),
          ],
        ),
      ),
    );
  }
}