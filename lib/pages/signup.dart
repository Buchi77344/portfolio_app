import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _firstNameController =TextEditingController();
  final _lastNameController =TextEditingController();
  final _emailController =TextEditingController();
  final _passwordController =TextEditingController();
  final _comfirmpasswordController =TextEditingController();

  bool _loading = false ;

  Future<void> signup () async {
    final firstName  = _firstNameController.text.trim();
    final lastName  = _lastNameController.text.trim();
    final email  = _emailController.text.trim();
    final password  = _passwordController.text.trim();
    final comfirm  = _comfirmpasswordController.text.trim();

    if (firstName.isEmpty||
        lastName.isEmpty||
        email.isEmpty||
        password.isEmpty||
        comfirm.isEmpty
    ) {
      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('All fields are required')));
      return;
    }

    if (password != comfirm) {
      ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Password do not match')));
      return;
    }

    setState( () => _loading =true );
   try {
    final credentials = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

    await  FirebaseFirestore.instance.collection('user').doc(credentials.user!.uid).set({
      'first_name': firstName,
      'last_name' : lastName,
      'email':email,
      'created_at': FieldValue.serverTimestamp(),
   });
     ScaffoldMessenger.of(context).showSnackBar( const SnackBar(content: Text('Signup sucessfully')));
    

    
   } on FirebaseAuthException catch (e) { 
    String message = '';
     print("❌ Signup failed: ${e.code} - ${e.message}");
    if (e.code == 'weak-password') {
      message = 'password is too weak';
    } else if (e.code == 'email-already-in-use') {
      message ='Email already exist';
    } else {
      message = 'signup failed : ${e.code} - ${e.message}';
    }
    ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(message)));

   } finally {
    setState(() => _loading =false);
   }

  }

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
                
               
                  
              const  Text('Create an account to get started', 
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: h *0.05,),
                Padding(
                  padding:  EdgeInsets.only(left: w *0.05, right: w *0.05 ,top:  h *0.02 ,bottom:  h *0.02 ),
                  child: Row(
                    children: [
                      Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(255, 10, 85, 146),
                              blurRadius: 10,
                              offset: Offset(0, 5),
                              spreadRadius: 6,
                            )
                          ]
                        ),
                        child: TextField(
                          controller: _firstNameController,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            prefixIcon: const Icon(Icons.person, color: Colors.black,),
                            fillColor: Colors.white,
                            hintText: 'First Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                              
                              
                            ),
                            
                          ),
                          
                        ),
                      ),
                    ),
                    SizedBox(width: w * 0.05,),
                    Expanded(
                      child: Container(
                         decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:const [
                            BoxShadow(
                              color:  Color.fromARGB(255, 10, 85, 146),
                              blurRadius: 10,
                              offset:  Offset(0, 5),
                              spreadRadius: 6,
                            )
                          ]
                        ),
                        child: TextField(
                          controller: _lastNameController,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            filled: true,
                            prefixIcon: const Icon(Icons.person, color: Colors.black,),
                            fillColor: Colors.white,
                            hintText: 'Last Name',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          
                        ),
                      ),
                    ),
                    ],
            
                  ),
                  
                ),
                Padding(
                  padding:   EdgeInsets.only(left: w *0.05, right: w *0.05 ,top:  h *0.02 ,bottom:  h *0.02 ),
                  child: Row(
                    children: [
                       Expanded(
                        child: Container(
                           decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:const [
                            BoxShadow(
                              color:  Color.fromARGB(255, 10, 85, 146),
                              blurRadius: 10,
                              offset:  Offset(0, 5),
                              spreadRadius: 6,
                            )
                          ]
                        ),
                          child: TextField(
                            controller: _emailController,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              prefixIcon: const Icon(Icons.email, color: Colors.black,),
                              fillColor: Colors.white,
                              hintText: 'Email',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                 Padding(
                  padding:  EdgeInsets.only(left: w *0.05, right: w *0.05 ,top:  h *0.02 ,bottom:  h *0.02 ),
                  child: Row(
                    children: [
                       Expanded(
                        child: Container(
                           decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:const [
                            BoxShadow(
                              color:  Color.fromARGB(255, 10, 85, 146),
                              blurRadius: 10,
                              offset:  Offset(0, 5),
                              spreadRadius: 6,
                            )
                          ]
                        ),
                          child: TextField(
                            controller: _passwordController,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              prefixIcon: const Icon(Icons.lock, color: Colors.black,),
                              fillColor: Colors.white,
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            
                          ),
                        ),
                      ),
                       SizedBox(width: w * 0.05,),
                      Expanded(
                        child: Container(
                           decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:const [
                            BoxShadow(
                              color:  Color.fromARGB(255, 10, 85, 146),
                              blurRadius: 10,
                              offset:  Offset(0, 5),
                              spreadRadius: 6,
                            )
                          ]
                        ),
                          child: TextField(
                            controller: _comfirmpasswordController,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              filled: true,
                              prefixIcon: const Icon(Icons.lock, color: Colors.black,),
                              fillColor: Colors.white,
                              hintText: 'Comfirm Password',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none,
                              ),
                            ),
                            
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding:  EdgeInsets.all(w * 0.015),
                  child: Row(
                    mainAxisAlignment:  MainAxisAlignment.center,
                    children: [
                      Container(
                         decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:const [
                            BoxShadow(
                              color:  Color.fromARGB(255, 10, 85, 146),
                              blurRadius: 10,
                              offset:  Offset(0, 5),
                              spreadRadius: 6,
                            )
                          ]
                        ),
                      
                        child:  _loading ? const CircularProgressIndicator() : ElevatedButton(onPressed: signup,
                         
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                          
                          
                          
                          textStyle: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                         child: Padding(
                           padding:  EdgeInsets.only(left: w *0.1 ,right: w *0.1, top: h * 0.015 , bottom: h *0.015),
                           child:  Text('Sign Up', style: TextStyle(color: Colors.black,
                           fontSize: w *0.005 + 15
                           ),
                           
                           
                        
                           ),
                         )),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h *0.010,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account ?',style: TextStyle(
                      color: Colors.white
                    ),),
                    SizedBox(width: w * 0.006,),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text('login',style: TextStyle(
                        color: Colors.blueAccent,
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.blueAccent,
                        decorationThickness: 2,
                        fontSize: w * 0.005 + 12,
                      ),),
                    )
                  ],
                )
              ],
            ),
            );
          }
        ),
      ),
    );
  }
}