import 'package:flutter/material.dart';
import 'package:flutter_test_application/screens/login/login_screen.dart';

void main() {
  runApp(MaterialApp(home: LoginScreen()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      title: "Hoomweb",
    );
  }
}
