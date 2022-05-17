import 'package:flutter/material.dart';
import 'package:navigator_app/Pages/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
        elevation: 0,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 페이지 이동 이벤트
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SecondPage(),
                ));
          },
          child: const Text('Go to the second page'),
        ),
      ),
    );
  }
}
