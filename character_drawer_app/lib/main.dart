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

  late TextEditingController textEditingController;
  late String character;
  late List str;
  late int index;
  late String  charactera;
 

  @override
  void initState() {
    super.initState();
    character = "";
    textEditingController = TextEditingController();
    str = [];
    index = -1;
    charactera="";

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
                      charactera = textEditingController.text;
                      str = charactera.split('');
                    });
                  },
                  child: const Text('광고문구 생성'),
                ),
              ],
            ),
          ),
        ),
        body: Center(
          child: Text(character),
        ),
      ),
    );
  }

  sumStr(){
    setState(() {
      index++;
      if(index == str.length){
        index = 0;
        character = '';
      }
      character += str[index];
    });
  }

}
