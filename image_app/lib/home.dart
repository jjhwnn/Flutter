
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(  // body의 배경색
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text('Image Test'),
      ),
      body: Center(
        child: Image.asset(   // 이미지 파일 불러오기
          'images/smile.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}