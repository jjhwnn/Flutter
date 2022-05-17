import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text('Image Fitting'),

    ),
    body: Center(
      child:  Column(
        children: [
          Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
            ),
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
              fit: BoxFit.contain,  // boxFit 디폴트 주로사용
            ),
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
              fit: BoxFit.fill, // 가로 세로 꽉채우기
            ),
            Image.asset(
              'images/turtle.gif',
              width: 50,
              height: 100,
              fit: BoxFit.cover,
            ),
          ]
        ),
      ),

    );
  }
}