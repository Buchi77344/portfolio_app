import 'package:flutter/material.dart';



class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Builder(
          builder: (context) {
            double w = MediaQuery.of(context).size.width;
            double h = MediaQuery.of(context).size.height;
            return Container(
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
                    color: Colors.white,
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
                  padding:  EdgeInsets.all( w * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(onPressed: () {
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
                      
                      child:  Padding(
                        padding:  EdgeInsets.only(left: w * 0.1, right: w * 0.1, top: h * 0.005 + 2, bottom: h * 0.005 + 2),
                        child:  Text('Log In',style: TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: w * 0.005 + 20,
                        ),),
                      ),
                      ),
                      
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text('New to Todo ? Sign Up',style: TextStyle(
                    color: Colors.white
                  ),),
                )
              ],
            ),
              
            );
          }
        )),
    );
  }
}