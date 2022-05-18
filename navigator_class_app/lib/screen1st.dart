
import 'package:flutter/material.dart';

class Screen1st extends StatelessWidget {
  const Screen1st({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text(''),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text(
          'Screen 1st',
          style: TextStyle(fontSize: 20),
        )
        ),
    );
  }
}