import 'package:flutter/material.dart';

class ImageGridScreen extends StatelessWidget {
  const ImageGridScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Sample image URLs
    final List<String> imageList = List.generate(
      12,
          (index) => "https://picsum.photos/200?random=$index",
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Grid"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: imageList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // 👈 4 images per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageList[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}