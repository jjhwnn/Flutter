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
  late bool _switchValue;
  late Color _buttonColor;

  @override
  void initState() {
    _switchValue = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Changed Button color on Switch')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(_buttonColor)),
              child: const Text('Flutter'),
            ),
            const SizedBox(
              height: 50,
            ),
            Switch(
              value: _switchValue,
              onChanged: (value) {
                setState(() {
                  _switchValue = value;
                });
                _onClick();
              },
            ),
          ],
        ),
      ),
    );
  }

  // 클릭시 버튼색깔 바꿔주는 메서드
  _onClick() {
    setState(() {
      if (_switchValue) {
        _buttonColor = Colors.red;
      }else {
        _buttonColor = Colors.blue;
      }
    });
  }
}
