import 'package:drawer_ex_app/home.dart';
import 'package:drawer_ex_app/receivedMail.dart';
import 'package:drawer_ex_app/sendMail.dart';
import 'package:flutter/material.dart';


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
