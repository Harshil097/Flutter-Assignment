import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // Sample products
    final List<Map<String, String>> products = [
      {
        "name": "Shoes",
        "price": "₹1999",
        "image": "https://picsum.photos/200?1"
      },
      {
        "name": "Watch",
        "price": "₹2999",
        "image": "https://picsum.photos/200?2"
      },
      {
        "name": "Bag",
        "price": "₹1499",
        "image": "https://picsum.photos/200?3"
      },
      {
        "name": "T-Shirt",
        "price": "₹799",
        "image": "https://picsum.photos/200?4"
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          scrollDirection: Axis.horizontal, // 👈 horizontal scroll
          children: products.map((product) {
            return Container(
              width: 160,
              margin: const EdgeInsets.only(right: 10),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Product Image
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.network(
                        product["image"]!,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // Name
                          Text(
                            product["name"]!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 5),

                          // Price
                          Text(
                            product["price"]!,
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}