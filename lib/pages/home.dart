import 'package:flutter/material.dart';
import 'package:portfolio_app/components/list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      appBar: AppBar(
        title: const Text('Task Manager',style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),),
        backgroundColor: const Color.fromARGB(255, 2, 18, 24),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: () {
            Navigator.pop(context); // Go back
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color.fromARGB(255, 3, 29, 52),Color.fromARGB(255, 2, 18, 24)])
            
        ),
        
      child:  Padding(
        padding:  const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Tasks List',style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold
            ),),
            const SizedBox(height: 20,),
            Row(
              children: [
                Expanded(child: TextField(
                  style: const TextStyle(
                    color: Colors.white
                  ),
                  decoration: InputDecoration(
                   enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  
                   ),
                   focusedBorder: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(30),
                   ),
                   prefixIcon: Icon(Icons.search, color: Colors.grey[600],),
                   suffixIcon: Icon(Icons.voice_chat, color: Colors.grey[600],),
                   filled: true,
                   fillColor: Colors.grey[900],
                   hintText:'Search '
                   
                  ),
                ))
              ],
            ),

            const SizedBox(height: 20,),

            TaskList(
              tasks: const ['Task 1', 'Task 2', 'Task 3'],
              onDelete: (index) {
                // Handle delete action
              },
            ),
          ],
        ),
      ),
      )
      ),
    );
  }
}