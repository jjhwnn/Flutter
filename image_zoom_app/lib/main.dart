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
        primarySwatch: Colors.red,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //property
  late String _lampImage; //Image name
  late double _lampWidth; //이미지 크기
  late double _lampHeight;
  late String _buttonName; //버튼이름
  late bool _switch; //스위치
  late String _lampSizeStatus; //이미지 사이즈 status

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 150;
    _lampHeight = 300;
    _buttonName = 'Image 확대';
    _switch = true;
    _lampSizeStatus = 'small';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image 확대 및 축소'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(  //sizebox 대신 container 쓰면 색을 지정할 수 있음 color: 으로!
              width: 350,
              height: 650,
              child: Column( 
                mainAxisAlignment: MainAxisAlignment.center, //컬럼을 넣어줘야 사이즈 박스랑 이미지 크기랑 따로 지정이 가능 
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
                TextButton(
                  onPressed: () {
                    setState(() {
                      decisionLampSize();
                    });
                  },
                  child: Text(_buttonName),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text('전구 스위치'),
                    Switch(
                      value: _switch,
                      onChanged: (value) {
                        setState(() {
                          _switch = value;
                          decisionOnOff();
                        });
                      },
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  decisionOnOff() {
    if (_switch == true) {
      _lampImage = 'images/lamp_on.png';
    } else {
      _lampImage = 'images/lamp_off.png';
    }
  }
  decisionLampSize(){
    if( _lampSizeStatus =='small'){
     
      _lampHeight=600;
      _lampWidth=300;
      _buttonName='Image 축소';
      _lampSizeStatus='large';
     
    }else{
      _lampHeight=300;
      _lampWidth=150;
      _buttonName='Image 확대';
      _lampSizeStatus='small';

    }
  }
} //end