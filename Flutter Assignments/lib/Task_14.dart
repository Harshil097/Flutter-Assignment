import 'package:flutter/material.dart';

class PhotoGalleryScreen extends StatelessWidget {
  const PhotoGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Sample image URLs
    final List<String> images = List.generate(
      20,
          (index) => "https://picsum.photos/300?random=$index",
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Photo Gallery"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 images per row
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              images[index],
              fit: BoxFit.cover,

              // 🔥 Loading Indicator
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;

                return const Center(
                  child: CircularProgressIndicator(),
                );
              },

              // ❌ Error Handling (optional but good)
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(Icons.error),
                );
              },
            ),
          );
        },
      ),
    );
  }
}