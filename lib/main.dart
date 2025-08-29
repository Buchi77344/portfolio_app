
import 'package:flutter/material.dart';

import 'package:portfolio_app/pages/home.dart';
import 'package:portfolio_app/pages/login.dart';
import 'package:portfolio_app/pages/signup.dart';
import 'package:portfolio_app/pages/welcome.dart';



void main() async {

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false,
      home:const WelcomePage() ,
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const Signup(),
  },
    );
  }
}

