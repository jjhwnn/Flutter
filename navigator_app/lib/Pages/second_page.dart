import 'package:flutter/material.dart';
import 'package:navigator_app/Pages/first_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 자기 페이지 만 없애기
            Navigator.pop(context);
          },
          style: ButtonStyle( //모든 버튼 스타일 공통 소스코드***
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          child: const Text('Go to the first page'),
        ),
      ),
    );
  }
}
