import 'dart:async';
import 'package:flutter/material.dart';

class AutoImageCarouselScreen extends StatefulWidget {
  const AutoImageCarouselScreen({super.key});

  @override
  State<AutoImageCarouselScreen> createState() => _AutoImageCarouselScreenState();
}

class _AutoImageCarouselScreenState extends State<AutoImageCarouselScreen> {

  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<String> images = [
    "https://picsum.photos/400?random=1",
    "https://picsum.photos/400?random=2",
    "https://picsum.photos/400?random=3",
    "https://picsum.photos/400?random=4",
  ];

  @override
  void initState() {
    super.initState();

    // 🔄 Auto slide every 3 seconds
    Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentPage < images.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }

      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Carousel"),
      ),
      body: Column(
        children: [

          SizedBox(
            height: 250,
            child: PageView.builder(
              controller: _pageController,
              itemCount: images.length,
              onPageChanged: (index) {
                currentPage = index;
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          // 🔘 Indicator dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(images.length, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: currentPage == index ? 12 : 8,
                height: currentPage == index ? 12 : 8,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentPage == index
                      ? Colors.blue
                      : Colors.grey,
                ),
              );
            }),
          )
        ],
      ),
    );
  }
}