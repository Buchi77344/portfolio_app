import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_app/firebase_options.dart';
import 'package:portfolio_app/pages/home.dart';
import 'package:portfolio_app/pages/login.dart';
import 'package:portfolio_app/pages/signup.dart';
import 'package:portfolio_app/pages/welcome.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
   );
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

