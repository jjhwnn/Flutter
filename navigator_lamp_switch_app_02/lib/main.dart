import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app_02/controller.dart';

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
  late String _lampImage;
  late bool lampStatus;
  late bool lampColor;

  @override
  void initState() {
    super.initState();
    _lampImage = 'images/lamp_on.png';
    lampStatus = true;
    lampColor = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Main 화면'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return Controller(lampColor: lampColor, lampStatus: lampStatus);
                  }),
                ).then((value) => getData(value));
              },
              icon: const Icon(Icons.edit),
            ),
          ],
        ),
        body: Center(
          child: Image.asset(
            _lampImage,
            width: 150,
            height: 300,
          ),
        ));
  }

  // --- Functions
  getData(value){
    print("Controller : ${value[0]}, ${value[1]}");
    setState(() {
      if(value[0]){
        if(value[1]){
          _lampImage = 'images/lamp_on.png';
          lampColor = true;
        }else{
          _lampImage = 'images/lamp_red.png';
          lampColor = false;
        }
        lampStatus = true;
      }else{
        _lampImage = 'images/lamp_off.png';
        lampStatus = false;
        if(value[1]){
          lampColor = true;
        }else{
          lampColor = false;
        }

      }
    });
  }

} // End
