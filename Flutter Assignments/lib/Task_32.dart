import 'package:flutter/material.dart';

class CustomStackButtonScreen extends StatelessWidget {
  const CustomStackButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Stack Button"),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            print("Button Clicked");
          },
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [

              // Button Base
              Container(
                width: 140,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    "Upload",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),

              // Icon (overlay above)
              const Positioned(
                top: -20, // 👈 overlap effect
                child: CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.cloud_upload,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}