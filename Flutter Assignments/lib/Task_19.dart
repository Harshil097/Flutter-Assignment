import 'package:flutter/material.dart';

class SearchSuggestionScreen extends StatefulWidget {
  const SearchSuggestionScreen({super.key});

  @override
  State<SearchSuggestionScreen> createState() => _SearchSuggestionScreenState();
}

class _SearchSuggestionScreenState extends State<SearchSuggestionScreen> {

  final TextEditingController searchController = TextEditingController();

  final List<String> allItems = [
    "Apple",
    "Banana",
    "Mango",
    "Orange",
    "Pineapple",
    "Grapes",
    "Strawberry",
    "Watermelon",
    "Kiwi",
    "Papaya"
  ];

  List<String> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = allItems;
  }

  void filterSearch(String query) {
    setState(() {
      filteredItems = allItems
          .where((item) =>
          item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search Suggestions"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // Search Bar
            TextField(
              controller: searchController,
              onChanged: filterSearch,
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // Suggestions List
            Expanded(
              child: ListView.builder(
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredItems[index]),
                    onTap: () {
                      print("${filteredItems[index]} selected");
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}