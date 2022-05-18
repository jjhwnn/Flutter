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
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Bar Icon'),
        backgroundColor: Colors.amberAccent,
        foregroundColor: Color.fromARGB(255, 246, 141, 141),
        leading: IconButton(
          onPressed: () {},
          // 메뉴 아이콘 (햄버거 버튼)
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            // 이메일 버튼
            icon: const Icon(Icons.email),
          ),
          IconButton(
            onPressed: () {},
            // 이메일 버튼
            icon: const Icon(
              Icons.add_alarm,
            ),
          ),
          IconButton(
            onPressed: () {},
            // 이메일 버튼
            icon: const Icon(
              Icons.add_outlined,
            ),
          ),
          GestureDetector(
            //
            onTap: () {
              // 
            },
            child: Image.asset(
              'images/smile.png',
              width: 30,
              height: 30,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}
