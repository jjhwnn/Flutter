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

  late TextEditingController textEditingController1;
  late TextEditingController textEditingController2;
  late int result;

  @override
  void initState() {
    textEditingController1 = TextEditingController();
    textEditingController2 = TextEditingController();
    result = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('간단한 덧셈 계산기'),
      ),
      body: Column(
        children: [
          Text(
            '덧셈 결과: $result',
            style: TextStyle(fontSize: 20),
            ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: textEditingController1,
            keyboardType: TextInputType.text,
          ),
          
          TextField(
            controller: textEditingController2,
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              if(textEditingController1.text.isEmpty || textEditingController2.text.isEmpty){
                
                errorSnackBar(context);
              }else{
                setState(() {
                  result = int.parse(textEditingController1.text)+int.parse(textEditingController2.text);
                });
              }
            },
            child: const Text('덧셈 계산'))

        ],
      ),
    );
  }


    errorSnackBar(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('글자를 입력하세요'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        )
    );
  }

}