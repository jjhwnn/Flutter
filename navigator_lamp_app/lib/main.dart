import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/message.dart';
import 'package:navigator_lamp_app/update.dart';

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
  late TextEditingController textEditingController;
  late String imagePath;

  @override
  void initState() {
    textEditingController = TextEditingController();
    textEditingController.text = '';
    imagePath = Lamp.lampImage;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Main 화면'),
          leading: IconButton(
            onPressed: () {
              //
            },
            icon: const Icon(Icons.home),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    Lamp.text = textEditingController.text;
                  });
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UpdatePage()))
                      // 되돌아 올때 변경된 전구와 텍스트 정보 반영된 채로 돌아오기
                      .then((value) => getDate());
                },
                icon: const Icon(Icons.edit))
          ],
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: textEditingController,
                  decoration: const InputDecoration(labelText: '글자를 입력하세요'),
                  keyboardType: TextInputType.text,
                  maxLines: 1,
                ),
                GestureDetector(
                  onTap: () {
                    // 전구 이미지 누르면 전구 끄고켜기
                    lampOnOff();
                  },
                  child: Image.asset(
                    imagePath,
                    height: 300,
                    width: 150,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  getDate() {
    setState(() {
      // 이미지경로, 수정페이지에서 수정된 텍스트 정보 저장
      imagePath = Lamp.lampImage;
      textEditingController.text = Lamp.text;
    });
  }

  // 전구 사진 눌러서 끄고 켜기
  lampOnOff(){
    setState(() {
      if(imagePath == 'images/lamp_on.png'){
        imagePath = 'images/lamp_off.png';
      }else{
        imagePath = 'images/lamp_on.png';
      }
      Lamp.lampImage = imagePath; 
    });
  }
}
