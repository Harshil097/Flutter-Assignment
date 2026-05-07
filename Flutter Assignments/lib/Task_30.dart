import 'package:flutter/material.dart';

class StackProfileScreen extends StatelessWidget {
  const StackProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
      ),
      body: Column(
        children: [

          // Stack for image
          Stack(
            clipBehavior: Clip.none,
            children: [

              // Background Container
              Container(
                height: 150,
                width: double.infinity,
                color: Colors.blue,
              ),

              // Positioned Profile Image
              Positioned(
                bottom: -50, // 👈 overlap effect
                left: MediaQuery.of(context).size.width / 2 - 50,
                child: const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/Profile_img.jpg')
                ),
              ),
            ],
          ),

          const SizedBox(height: 60), // space for overlap

          // Name
          const Text(
            "Harshil Shah",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          // Bio
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Flutter Developer 🚀 | Passionate about building beautiful apps.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}