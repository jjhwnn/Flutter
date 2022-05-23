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

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    _lampWidth = 300;
    _lampHeight = 600;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Alert를 이용한 메세지 출력'),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              _lampImage,
              width: _lampWidth,
              height: _lampHeight,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    _checkOn(context);
                    _showLampOn(context);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  child: const Text('켜기'),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () {
                    _checkOff(context);
                    _showLampOff(context);
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  child: const Text('끄기'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 램프 켜져있을 때 램프 켜져있다는 Alert
  _showLampOn(BuildContext context) {
    if (_lampImage == 'images/lamp_on.png') {
      showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('경고'),
            content: const Text('현재 램프가 켜진 상태 입니다.'),
            actions: [
              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text('네 알겠습니다.')),
              )
            ],
          );
        },
      );
    }
  }

  // 램프 꺼져있을 때 램프 꺼져있다는 Alert
  _showLampOff(BuildContext context) {
    if (_lampImage == 'images/lamp_off.png') {
      showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('경고'),
            content: const Text('현재 램프가 꺼진 상태 입니다.'),
            actions: [
              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text('네 알겠습니다.')),
              )
            ],
          );
        },
      );
    }
  }

  // 램프 끄기
  _checkOff(BuildContext context) {
    if (_lampImage == 'images/lamp_on.png') {
      showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('램프 끄기'),
            content: const Text('램프를 끄시겠습니까?'),
            actions: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _lampImage = 'images/lamp_off.png';
                          Navigator.of(ctx).pop();
                        });
                      },
                      child: const Text('네'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: const Text('아니요'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    }
  }

  // 램프 켜기
  _checkOn(BuildContext context) {
    if (_lampImage == 'images/lamp_off.png') {
      showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('램프 켜기'),
            content: const Text('램프를 켜시겠습니까?'),
            actions: [
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _lampImage = 'images/lamp_on.png';
                          Navigator.of(ctx).pop();
                        });
                      },
                      child: const Text('네'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: const Text('아니요'),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      );
    }
  }
}
