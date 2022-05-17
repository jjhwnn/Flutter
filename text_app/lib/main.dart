import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
 //statelessWidget : 상태변화가 없는 위젯 

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
      debugShowCheckedModeBanner: false, // debug 리본 제거
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: const Text(
          "대한민국",
        ),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Colors.black,
      ),

      //내용쓰는부분
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '유비',
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              '관우'
            ),
            Text(
              "장비",
            ),
          ],
        ),
      ),
    );
  }
}
