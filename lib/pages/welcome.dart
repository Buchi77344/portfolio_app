import 'package:flutter/material.dart';



class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color.fromARGB(255, 3, 29, 52),Color.fromARGB(255, 2, 18, 24)])
            
        ),
        child:  Column(
          children: [
      const       Padding(
              padding:  EdgeInsets.all(32.0),
              child: Icon(  Icons.flutter_dash, 
                size: 100, 
                color: Colors.white70,
              ),
            ),
          const  SizedBox(height: 30,),
            const Center(
              child: Text('My ToDo App', 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              
            ),
           
          const  SizedBox(height: 10,),
          const  Text('Organise Your tasks, simplify your life', 
              style: TextStyle(
                color: Colors.white70,
                fontSize: 20,
              ),
            ),
           const SizedBox(height: 200,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(179, 255, 255, 255),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ) 
                    ), 
                    child:  const Text('Log In',style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),),
                    ),
                  ),
                  
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Text('New to Todo ? Sign Up',style: TextStyle(
              color: Colors.white
            ),)
          ],
        ),
          
        )),
    );
  }
}