import 'package:flutter/material.dart';
import 'package:henrys/src/pages/auth/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Henry's",
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SignInScreen(),
    );
  }
}