import 'package:flutter/material.dart';

class Item {
  final String title;
  final String description;

  Item({required this.title, required this.description});
}

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  List<Item> items = [
    Item(title: "Task 1 Description for Task 1 ", description: "Description for Task 1"),
    Item(title: "Task 2", description: "Description for Task 2"),
    Item(title: "Task 3", description: "Description for Task 3"),
  ];

  // Function to show the detail modal
void _showDetail(Item item) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.grey[900],
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    isScrollControlled: true, // Important for larger height
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.9, // 70% of screen height
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    item.description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Close"),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            color: Colors.white10,
            child: ListTile(
              title: Text(
                item.title,
                style: const TextStyle(color: Colors.white),
                 maxLines: 1, // only one line
                  overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                item.description,
                style: const TextStyle(color: Colors.white70),
              ),
              onTap: () => _showDetail(item), // <-- Tap opens modal
            ),
          );
        },
      ),
    );
  }
}
