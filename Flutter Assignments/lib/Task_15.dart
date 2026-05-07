import 'package:flutter/material.dart';

class AssetImageFitScreen extends StatelessWidget {
  const AssetImageFitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image BoxFit Demo"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            // BoxFit.cover
            const Text("BoxFit.cover"),
            Container(
              height: 150,
              width: 250,
              color: Colors.grey,
              child: Image.asset(
                "assets/images/Profile_img.jpg",
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // BoxFit.contain
            const Text("BoxFit.contain"),
            Container(
              height: 150,
              width: 250,
              color: Colors.grey,
              child: Image.asset(
                "assets/images/Profile_img.jpg",
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 20),

            // BoxFit.fill
            const Text("BoxFit.fill"),
            Container(
              height: 150,
              width: 250,
              color: Colors.grey,
              child: Image.asset(
                "assets/images/Profile_img.jpg",
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}