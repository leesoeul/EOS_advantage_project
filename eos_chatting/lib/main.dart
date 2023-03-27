import 'package:flutter/material.dart';
import 'package:eos_chatting/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'first App',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        fontFamily: 'Teko'
      ),
      home: LoginSignUpScreen());
  }
}
