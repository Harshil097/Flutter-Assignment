import 'package:flutter/material.dart';

class TodoSwipeScreen extends StatefulWidget {
  const TodoSwipeScreen({super.key});

  @override
  State<TodoSwipeScreen> createState() => _TodoSwipeScreenState();
}

class _TodoSwipeScreenState extends State<TodoSwipeScreen> {

  final TextEditingController taskController = TextEditingController();
  List<String> tasks = [];

  void addTask() {
    if (taskController.text.isEmpty) return;

    setState(() {
      tasks.add(taskController.text);
      taskController.clear();
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do List"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // Input + Add Button
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: taskController,
                    decoration: const InputDecoration(
                      hintText: "Enter task...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: addTask,
                  child: const Text("Add"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Task List
            Expanded(
              child: tasks.isEmpty
                  ? const Center(child: Text("No tasks yet"))
                  : ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: Key(tasks[index]),

                    // Swipe direction
                    direction: DismissDirection.endToStart,

                    // Background while swiping
                    background: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),

                    onDismissed: (direction) {
                      deleteTask(index);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Task deleted"),
                        ),
                      );
                    },

                    child: Card(
                      child: ListTile(
                        title: Text(tasks[index]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}