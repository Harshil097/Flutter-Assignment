import 'package:flutter/material.dart';

class InfiniteListScreen extends StatefulWidget {
  const InfiniteListScreen({super.key});

  @override
  State<InfiniteListScreen> createState() => _InfiniteListScreenState();
}

class _InfiniteListScreenState extends State<InfiniteListScreen> {

  final ScrollController _scrollController = ScrollController();

  List<int> items = List.generate(20, (index) => index);
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        loadMoreData();
      }
    });
  }

  void loadMoreData() async {
    if (isLoading) return;

    setState(() {
      isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2)); // simulate API

    List<int> newItems =
    List.generate(10, (index) => items.length + index);

    setState(() {
      items.addAll(newItems);
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Infinite List"),
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: items.length + 1, // extra for loader
        itemBuilder: (context, index) {

          if (index < items.length) {
            return ListTile(
              title: Text("Item ${items[index]}"),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const SizedBox(),
              ),
            );
          }
        },
      ),
    );
  }
}