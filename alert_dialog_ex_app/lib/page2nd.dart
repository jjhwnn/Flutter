
import 'package:flutter/material.dart';

class secondPage extends StatelessWidget {
  const secondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Second Page'),

      ),
      body: const Center(
        child: Text(
          '2번째 페이지 입니다.'
        ),
      ),
    );
  }
}