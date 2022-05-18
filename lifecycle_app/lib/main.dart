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

// StatefulWidget 동적위젯
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyHomePage> {
  // Property
  // Consturctor
  // Method
  late String _buttonState;
  late String _buttonName;

  // Color변수
  late Color _buttonColor;

  //  
  @override
  void initState() {
    _buttonState = 'OFF';
    _buttonName = '버튼을 누르세요';
    _buttonColor = Colors.red;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Life Cycle'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _onClick();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(_buttonColor)
              ),
              child: Text(_buttonName),
            ),
            const SizedBox(
              height: 50,
            ),
            Text("버튼 상태 : $_buttonState"),
          ],
        ),
      ),
    );
  }

  // -- Functions
  _onClick(){
    // build에게 신호를 줌
    setState(() {
      if(_buttonState == "OFF"){
        _buttonState = 'ON';
        _buttonName = "Press Button";
        _buttonColor = Colors.yellow;
      }else {
        _buttonState = 'OFF';
        _buttonName = "버튼을 누르세요";
        _buttonColor = Colors.red;
      }
    });
  }

}
