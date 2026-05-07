import 'package:flutter/material.dart';

class TaskManagerScreen extends StatefulWidget {
  const TaskManagerScreen({super.key});

  @override
  State<TaskManagerScreen> createState() => _TaskManagerScreenState();
}

class _TaskManagerScreenState extends State<TaskManagerScreen> {

  final TextEditingController taskController = TextEditingController();

  List<Map<String, dynamic>> tasks = [];

  void addTask() {
    if (taskController.text.isEmpty) return;

    setState(() {
      tasks.add({
        "title": taskController.text,
        "isDone": false,
      });
      taskController.clear();
    });
  }

  void toggleTask(int index, bool? value) {
    setState(() {
      tasks[index]["isDone"] = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Manager"),
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
                )
              ],
            ),

            const SizedBox(height: 20),

            // Task List
            Expanded(
              child: tasks.isEmpty
                  ? const Center(child: Text("No tasks added"))
                  : ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(
                      tasks[index]["title"],
                      style: TextStyle(
                        decoration: tasks[index]["isDone"]
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    value: tasks[index]["isDone"],
                    onChanged: (value) => toggleTask(index, value),
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