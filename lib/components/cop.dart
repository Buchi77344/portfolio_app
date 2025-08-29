import 'package:flutter/material.dart';

class Item {
  final String title ;
  final String description ;

  Item({required this.title, required this.description});
}

class ListCard extends StatefulWidget {
  const ListCard({super.key});

  @override
  State<ListCard> createState() => _ListCardState();
}


class _ListCardState extends State<ListCard> {

 // 2. Create a list of model objects
  List<Item> items = [
    Item(title: "Flutter", description: "Cross-platform UI framework."),
    Item(title: "Dart", description: "Programming language for Flutter."),
    Item(title: "Firebase", description: "Backend services for apps."),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder:(context, index) {
          final item = items[index];
          return Card(
             child: ListTile(
               title: Text(item.title),
               subtitle: Text(item.description),
             ),
          );
        },
      ),
    );
  }
}