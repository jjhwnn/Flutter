import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 입력받을 텍스트변수 선언
  late TextEditingController textEditingController;
  // 글자를 하나씩 누적받을 변수
  late String character;
  // 글자를 하나씩 저장할 배열
  late List str;
  // 인덱스 번지
  late int index;

  @override
  void initState() {
    super.initState();
    character = "";
    textEditingController = TextEditingController();
    str = [];
    index = -1;

    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      sumStr();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('LED 광고'),
        ),
        drawer: Drawer(
          child: Center(
            child: Column(
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '광고 문구를 입력하세요',
                        style: TextStyle(fontSize: 20, color: Colors.yellow),
                      ),
                    ],
                  ),
                  width: 320,
                  height: 200,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: textEditingController,
                    decoration: const InputDecoration(labelText: '글자를 입력하세요'),
                    keyboardType: TextInputType.text,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    setState(() {
                      str = textEditingController.text.split('');
                    });
                  },
                  child: const Text('광고문구 생성'),
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: Text(
            character,
            style: const TextStyle(fontSize: 40),
          ),
        ),
      ),
    );
  }

  sumStr() {
    setState(() {
      index++;
      if (index == str.length) {
        index = 0;
        character = '';
      }
      character += str[index];
    });
  }
}
