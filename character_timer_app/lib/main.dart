import 'dart:async';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late String dispChr;
  late String character;
  late List str;
  late int index;

  @override
  void initState() {
    super.initState();
    dispChr = "대한민국";
    character = "";
    str = [];
    str = dispChr.split('');
    index = 0;

    Timer.periodic(const Duration(seconds: 1), (Timer timer) { 
      sumStr();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          'LED 광고',
          style: TextStyle(color: Colors.white),
          ),
      ),
      body: Center(
        child: Text(
          character,
          style: const TextStyle(fontSize: 40),
        )
        ),
    );
  }

  sumStr(){
    setState(() {

      if(index == str.length){
        index = 0;
        character = '';
      }
      character += str[index++];
    });
  }

}