import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/1st');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)
              ),
              child: const Text('Go to the screen #1'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/2nd');
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)
              ),
               child: const Text('Go to the screen #2')
            ),
          ],
        ),
      ),
    );
  }
}
