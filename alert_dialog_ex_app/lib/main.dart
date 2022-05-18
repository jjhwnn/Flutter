import 'package:alert_dialog_ex_app/page2nd.dart';
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
        title: const Text('Alert and push'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialog(context),
          child: Text('Move the 2nd page'),
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('Page 이동'),
          content: const Text('아래의 버튼을 누르면 페이지 이동을 합니다.'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  // 관련된 자료, pop
                  Navigator.of(ctx).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const secondPage(),
                    ),
                  );
                },
                child: const Text('Page 이동'))
          ],
        );
      },
    );
  }
}
