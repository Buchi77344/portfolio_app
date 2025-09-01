import 'package:flutter/material.dart';
import 'package:portfolio_app/components/flot.dart';
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
      body: Builder(
        builder: (context) {
            double w  = MediaQuery.of(context).size.width;
           double h  = MediaQuery.of(context).size.height;
          return SafeArea(
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
          
               const  TaskList(
                 
                ),
              FloatingBounceButton(
          text: "Click Me",
          onPressed: () {
            showModalBottomSheet(
              backgroundColor: Colors.grey[900],
              context:context,
              isScrollControlled: true,
              builder: (context) {
                return  FractionallySizedBox(
                heightFactor: 0.9,
                child:Padding(
                  padding: const  EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                             Container(
                               child: Padding(
                                 padding: const EdgeInsets.all(8),
                                 child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                   children: [
                                    const Icon(Icons.today_sharp,color: Colors.white,),
                                     
                           const       Expanded(
                                    child: Center(
                                      child: Text('Today, 30 Aug',style: TextStyle(
                                           color: Colors.white,
                                           fontWeight: FontWeight.bold,
                                           fontSize: 16
                                         ),),
                                    ),
                                  ) ,
                                 
                                   const    Icon(Icons.message_rounded,color: Colors.purple,),
                                   SizedBox(width: w * 0.025,),
                                   const  Text('Done',style: TextStyle(
                                       color: Colors.purple,  
                                     ))
                                   ],
                                 ),
                               ),
                             ),
          
                      TextField(
                        cursorColor: Colors.white,
                        decoration: InputDecoration(
                          hintText: 'Task Title',
                         hintStyle: TextStyle(color: Colors.white70,
                          fontSize: w * 0.03,
                          ),
                          border:const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white70),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white70),
                          ),
                          
                       
                        ),
                        style: const TextStyle(color: Colors.white),
                     ),
                  Expanded(
                    child:    SingleChildScrollView(
                      child: TextField(
                        cursorColor: Colors.white,
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                     decoration: InputDecoration(
                          hintText: 'Start typing your task here...',
                          hintStyle: TextStyle(color: Colors.white70,
                          fontSize: w * 0.03,
                          ),
                          border: InputBorder.none,
                       
                        ),
                    
                        style: const TextStyle(color: Colors.white),

                  ),
                    ),
                  ),
                     Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Close"),
                      ),
                     ),
                    ],
                  ),
                )
                );
              }
            );
          },
              ),
           const  SizedBox(height: 40,),
          
              ],
            ),
          ),
          )
          );
        }
      ),
    );
  }
}