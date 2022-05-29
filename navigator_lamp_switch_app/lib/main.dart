import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/update.dart';

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
  late String lampImage;

  @override
  void initState() {
    lampImage = 'images/lamp_on.png';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main 화면'),
          // 앱바 상단 오른쪽에 위치할때 action, 왼쪽은 leading :
          actions: [
            IconButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const UpdatePage(imagePath: lampImage,)),
                  // ).then((value) => getLamp());
                },
                icon: const Icon(Icons.edit)),
          ]),
      body: Center(
        child: Image.asset(
          lampImage,
          width: 150,
          height: 300,
        ),
      ),
    );
  }

  getLamp() {
    setState(() {
      // lampImage = imagePath;
    });
  }
}
