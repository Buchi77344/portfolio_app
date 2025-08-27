import 'package:flutter/material.dart';



class TaskList extends StatelessWidget {
  final List<String> tasks;
  final Function(int) onDelete;

  const TaskList({super.key, required this.tasks, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white10,
            child: ListTile(
              title: Text(
                tasks[index],
                style: const TextStyle(color: Colors.white),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.redAccent),
                onPressed: () => onDelete(index),
              ),
            ),
          );
        },
      ),
    );
  }
}