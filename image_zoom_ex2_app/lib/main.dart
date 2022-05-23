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
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    //property
  late String _lampImage; //Image name
  late double _lampWidth; //이미지 크기
  late double _lampHeight;
  late bool _switchSize; // 크기조절 스위치
  late bool _switchOnOff; // 전원 스위치
  late bool _switchColor; //; 전구색깔 변경 // 전구 색깔

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _switchSize = true;
    _switchOnOff = true;
    _switchColor = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Image 확대 및 축소'),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              width: 350,
              height: 650,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    _lampImage,
                    width: _lampWidth,
                    height: _lampHeight,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const Text('전구 색깔'),
                    Switch(value: _switchColor
                , onChanged: (value){
                    setState(() {
                      _switchColor = value;
                      decisionColor();
                    });
                }),
                  ],
                ),
                Column(
                  children: [
                    const Text('전구 확대'),
                    Switch(value: _switchSize
                , onChanged: (value){
                    setState(() {
                      _switchSize = value;
                      decisionLampSize();
                    });
                }),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    const Text('전구 스위치'),
                    Switch(
                      value: _switchOnOff
                    , onChanged: (value){
                        setState(() {
                          _switchOnOff = value;
                          decisionOnOff();
                        });
                    }),
                  ],
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
  // 전구 색깔 바꾸기
  decisionColor(){ 

    if(_switchOnOff){
      if(_switchColor){
        _lampImage = 'images/lamp_red.png';

      }else {
        _lampImage = 'images/lamp_on.png';
      }
    }
  }

  decisionLampSize(){
    if(_switchSize){
      _lampHeight=600;
      _lampWidth=300;
    }else{
      _lampHeight=300;
      _lampWidth=150;
    }
  }

  decisionOnOff(){
    if (_switchOnOff) {
      _lampImage = 'images/lamp_on.png';
    } else {
      _lampImage = 'images/lamp_off.png';
    }
  }
  // 조건 다시 작성
}