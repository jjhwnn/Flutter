import 'package:flutter/material.dart';
import 'package:navigator_appbar_ex_app/receivedMail.dart';
import 'package:navigator_appbar_ex_app/screen.dart';
import 'package:navigator_appbar_ex_app/sendMail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     routes: {
       '/' :(context) => const Home(),
       '/send' :(context) => const SendMail(),
       '/received' :(context) => const receivedMail()
     },
     initialRoute: '/',
    );
  }
}

