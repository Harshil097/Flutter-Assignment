import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {

  int cartCount = 0;

  final List<String> items = [
    "Shoes",
    "T-Shirt",
    "Watch",
    "Bag",
    "Sunglasses",
    "Jeans",
    "Jacket",
  ];

  void addToCart() {
    setState(() {
      cartCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping Cart"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Text(
                "Cart: $cartCount",
                style: const TextStyle(fontSize: 16),
              ),
            ),
          )
        ],
      ),

      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            trailing: ElevatedButton(
              onPressed: addToCart,
              child: const Text("Add to Cart"),
            ),
          );
        },
      ),
    );
  }
}