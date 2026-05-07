import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ---------------- MODEL ----------------

class Task {
  String title;
  bool isDone;

  Task({required this.title, this.isDone = false});
}

// ---------------- PROVIDER ----------------

final taskProvider =
StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier();
});

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier() : super([]);

  void addTask(String title) {
    state = [...state, Task(title: title)];
  }

  void deleteTask(int index) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i != index) state[i]
    ];
  }

  void toggleTask(int index) {
    state[index].isDone = !state[index].isDone;
    state = [...state];
  }
}

// ---------------- SCREEN ----------------

class TodoScreen extends ConsumerWidget {
  TodoScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do List"),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Enter Task",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      ref
                          .read(taskProvider.notifier)
                          .addTask(controller.text);
                      controller.clear();
                    }
                  },
                  child: const Text("Add"),
                ),
              ],
            ),
          ),

          Expanded(
            child: tasks.isEmpty
                ? const Center(
              child: Text(
                "No Tasks Added",
                style: TextStyle(fontSize: 20),
              ),
            )
                : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(
                    value: tasks[index].isDone,
                    onChanged: (value) {
                      ref
                          .read(taskProvider.notifier)
                          .toggleTask(index);
                    },
                  ),
                  title: Text(
                    tasks[index].title,
                    style: TextStyle(
                      decoration: tasks[index].isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      ref
                          .read(taskProvider.notifier)
                          .deleteTask(index);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}