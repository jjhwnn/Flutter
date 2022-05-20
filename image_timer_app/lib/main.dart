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
  // Property

  // 이미지 파일네임
  late List imageName;

  // 이미지 리스트 인덱스 번호
  late int currentImage;

  @override
  void initState() {
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png'
    ];
    currentImage = 0;


    
    super.initState();

    // Timer 설치
    Timer.periodic(const Duration(seconds: 0), (Timer timer) {
      changeImage();
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text('3초마다 이미지 무한 반복'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            // 이미지 네임
            imageName[currentImage],
          ),
          Image.asset(
            'images/${imageName[currentImage]}',
            width: 350,
            height: 600,
          )
        ],
      )),
    );
  }

  changeImage(){
    setState(() {
      currentImage++;
      if(currentImage >= imageName.length){
        currentImage = 0;
      }
    });
  }



}
