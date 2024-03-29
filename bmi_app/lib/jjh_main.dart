import 'package:bmi_app/jjh_bmiForm.dart';
import 'package:bmi_app/jjh_home.dart';
import 'package:bmi_app/jjh_result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        '/': (context) => const Home(),
        '/bmi': (context) => const MeasureBmi(),
        '/result': (context) => const Result(),
      },
    );
  }
}
