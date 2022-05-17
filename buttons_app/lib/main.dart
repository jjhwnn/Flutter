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
        title: const Text('Buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              // dart언어 함수, 한줄함수 : =>
              onPressed: () {
                // 버튼 짧게 누를때
                print('Text Button');
              },
              onLongPress: () {
                // 버튼 길게 누를때
                print("Long pressed text button");
              },
              child: const Text(
                'Text Button',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              style: TextButton.styleFrom(
                primary: Colors.red,
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                    // 버튼 모서리 조절
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text('Elevated button'),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  primary: Colors.green,
                  side: const BorderSide(
                      // 버튼 테두리
                      color: Colors.black87,
                      width: 2.0)),
              child: const Text(
                'Outlined button',
              ),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                size: 30,
              ),
              label: const Text('Go to home'),
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                size: 20,
              ),
              label: const Text('Home'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.black, minimumSize: const Size(140, 40)),
            ),
            
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                color: Colors.red,
              ),
              label: const Text('Go to Home'),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
              ),
            ),
            
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.home,
                color: Colors.pink,
                ),
              label: const Text('Go to Home'),
              style: ElevatedButton.styleFrom(
                primary: Colors.pink[100]
                ),
            ),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text('TextButton'),
                  ),

                ElevatedButton(
                  onPressed: () {},
                  child: const Text('ElevatedButton'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
