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
  State<MyHomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomePage> {
  late TextEditingController textNum1;
  late TextEditingController textNum2;
  late String result;
  late int resultNum;

  @override
  void initState() {
    textNum1 = TextEditingController();
    textNum2 = TextEditingController();
    resultNum = 0;
    result = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('덧셈 구하기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: textNum1,
              decoration: const InputDecoration(labelText: '첫번째 숫자를 입력하세요'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: textNum2,
              decoration: const InputDecoration(labelText: '두번째 숫자를 입력하세요'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (textNum1.text.isEmpty || textNum2.text.isEmpty) {
                  errorSnackBar(context);
                }else {
                  setState(() {
                    resultNum =
                        int.parse(textNum1.text) + int.parse(textNum2.text);
                    result = "입력하신 숫자의 합은 $resultNum 입니다.";
                  });
                }
              },
              child: const Text('덧셈 계산'),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              result,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 20
              ),
            ),
          ],
        ),
      ),
    );
  }

  errorSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('숫자를 입력하세요'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }
}
