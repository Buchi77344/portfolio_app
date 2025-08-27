import 'package:flutter/material.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Icon(  Icons.flutter_dash, 
                    size: 100, 
                    color: Colors.white70,
                  ),
                ),
                
              ),
              const SizedBox(height: 20,),
              const Text('Login', 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: const Icon(Icons.email, color: Colors.black54,),
                        fillColor: Colors.white,
                        hintText: 'Email',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      
                    ),
                  ),
                ],
              ),
               const SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        filled: true,
                        prefixIcon: const Icon(Icons.lock, color: Colors.black54,),
                        fillColor: Colors.white,
                        hintText: 'password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      
                    ),
                  ),
                ],
              ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text('New to Todo ? Sign Up',style: TextStyle(
                  color: Colors.white
                ),),
                    Text('Forgot Password ?',style: TextStyle(
                      color: Colors.white
                    ), )
                  ],
                ),
                const SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  const Color.fromARGB(255, 255, 255, 255),
                      padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                      textStyle: const TextStyle(
                        fontSize: 15,
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
                    
                  ],
                ),

                const SizedBox(height: 50,),

                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey[500],
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ),
                  Text( 'or continue with', style: TextStyle(
                    color: Colors.grey[300], ),),

                    Expanded(
                      child: Divider(
                        color: Colors.grey[500],
                        thickness: 1,
                        indent: 20,
                        endIndent: 20,
                      ),
                    ),
                  ],
                ),
             SizedBox(height: 50,),

             Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.facebook, color: Colors.white,),
                    label: const Text('Facebook', style: TextStyle(
                      color: Colors.white
                    ),),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),
                  ),
                ),
                const SizedBox(width: 20,),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.g_mobiledata, color: Colors.white,),
                    label: const Text('Google', style: TextStyle(
                      color: Colors.white
                    ),),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),
                  ),
                ),
              ],
             )
               
            ],
          ),
        ),
        ),
      ),
    );
  }
}