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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Dialog with Gesture'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: const Text(
            'Hello World',
          ),
        ),
      ),
    );
  }

  // -- Functions
  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      // alert 버튼 이외 부분 클릭시 이벤트 발생 X
      barrierDismissible: false, // user must tap button !
      builder: (BuildContext ctx) {
        // Alert 함수
        return AlertDialog(
          title: const Text('Alert Title'),
          content: const Text('Hello World를\nTouch했습니다.'),
          actions: [
            Center(
              child: TextButton(
                  onPressed: () {
                    // 종료 이벤트
                    Navigator.of(ctx).pop();
                  },
                  child: const Text('종료')),
            ),
          ],
        );
      },
    );
  }
}
