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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomePage> {
  late bool switchValue;

  @override
  void initState() {
    switchValue = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch'),
      ),
      body: Center(
        child: Switch(
          value: switchValue, // 화면에 보이는 value값
          onChanged: (value) {  // 사용자가 움직이는 value값
            setState(() { // build에게 바뀐 정보를 전달해주는 메서드
              switchValue = value;
            });

          },
        ),
      ),
    );
  }
}
