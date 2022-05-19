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
  // property
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      // 키보드 없애기 : 커서를 없앤다
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('single Textfield'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextField(
                //
                controller: textEditingController,
                decoration: const InputDecoration(labelText: '글자를 입력하세요'),
                // 키보드 타입(숫자 number, 문자 text)
                keyboardType: TextInputType.text, // text가 기본타입
                // 테두리 주기 : border~
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  // 사용자의 입력 내용 확인   trim():***문자열 양쪽 공백 제거***
                  if(textEditingController.text.trim().isEmpty){
                    errorSnackBar(context);
                  }else{
                    showSnakBar(context);
                  }
                },
                child: const Text('출력'),
              ),
            ],
          ),
        ),
      ),
    );
  }


  // -- Function
  
  // Desc : 정상적으로 입력한 글자 보여주기
  showSnakBar(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
        content: Text('입력한 글자는 ${textEditingController.text} 입니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
        )
    );
  }

  // Desc : 텍스트필드에 입력을 안하고 버튼을 눌렀을 경우
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
