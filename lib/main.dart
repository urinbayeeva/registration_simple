import 'package:flutter/material.dart';
import 'package:simple_log_in/pages/main_page.dart';
import 'package:simple_log_in/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Log-in',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
      routes: {
        '/signUp': (context) => const SignUp(),
        '/mainPage' : (context) => const MainPage(),
      },
    );
  }
}

