import 'package:flutter/material.dart';

class CardWithFabScreen extends StatelessWidget {
  const CardWithFabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Card with FAB"),
      ),
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [

            // Card UI
            Container(
              width: 300,
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(bottom: 30),
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Product Title",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "This is a sample description of the product inside the card.",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Floating Action Button (bottom-right)
            Positioned(
              bottom: 0,
              right: 0,
              child: FloatingActionButton(
                onPressed: () {
                  print("FAB Clicked");
                },
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}