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
  // 계산할 숫자 2개 선언
  late TextEditingController textNum1;
  late TextEditingController textNum2;

  // 덧셈, 뺄셈, 곱셈, 나눗셈 연산된 숫자 받는 변수 선언
  late TextEditingController resultAdd;
  late TextEditingController resultSub;
  late TextEditingController resultMul;
  late TextEditingController resultDiv;

  // 사칙연산 결과값 스위치 변수
  late bool switchAdd;
  late bool switchSub;
  late bool switchMul;
  late bool switchDiv;

  late int num1;
  late int num2;

  @override
  void initState() {
    //
    textNum1 = TextEditingController();
    textNum2 = TextEditingController();

    resultAdd = TextEditingController();
    resultSub = TextEditingController();
    resultMul = TextEditingController();
    resultDiv = TextEditingController();

    switchAdd = false;
    switchSub = false;
    switchMul = false;
    switchDiv = false;

    num1 = 0;
    num2 = 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // 화면 터치시 키보드 없애주기
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("간단한 계산기"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
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
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          num1 = int.parse(textNum1.text);
                          num2 = int.parse(textNum2.text);

                          if (textNum1.text.trim().isEmpty ||
                              textNum2.text.trim().isEmpty ) {
                            errorSnackBar(context);
                          }
                          
                          if(switchAdd){
                            setState(() {
                              resultAdd.text = (num1 + num2).toString();
                            });
                          }else{
                            setState(() {
                              resultAdd.text = "";
                            });
                          }
                          if(switchSub){
                            setState(() {
                              resultSub.text = (num1 - num2).toString();
                            });
                          }else{
                            setState(() {
                              resultSub.text = "";
                            });
                          }
                          if(switchMul){
                            setState(() {
                              resultMul.text = (num1 * num2).toString();
                            });
                          }else{
                            setState(() {
                              resultMul.text = "";
                            });
                          }
                          if(switchDiv){
                            setState(() {
                              resultDiv.text = ((num1 / num2).toStringAsFixed(2)).toString();
                            });
                          }else{
                            setState(() {
                              resultDiv.text = "";
                            });
                          }

                        },
                        child: const Text('계산하기')),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          // 값들을 다시 초기화
                          textNum1.text = "";
                          textNum2.text = "";
    
                          resultAdd.text = "";
                          resultSub.text = "";
                          resultMul.text = "";
                          resultDiv.text = "";
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.red),
                        ),
                        child: const Text('지우기')),
                  ],
                ),
                Row(
                  children: [
                    // 덧셈 스위치
                    Text('덧셈'),
                    Switch(
                      value: switchAdd,
                      onChanged: (value) {
                        setState(() {
                          switchAdd = value;
                        });
                        num1 = int.parse(textNum1.text);
                        num2 = int.parse(textNum2.text);
                        
                        if(switchAdd){
                            setState(() {
                              resultAdd.text = (num1 + num2).toString();
                            });
                        
                          }else{
                            setState(() {
                              resultAdd.text = "";
                            });
                          }
                      },
                      
                    ),
                    Text('뺄셈'),
                    Switch(
                      value: switchSub,
                      onChanged: (value) {
                        setState(() {
                          switchSub = value;
                        });
                        num1 = int.parse(textNum1.text);
                        num2 = int.parse(textNum2.text);

                        if(switchSub){
                            setState(() {
                              resultSub.text = (num1 - num2).toString();
                            });
                          }else{
                            setState(() {
                              resultSub.text = "";
                           });
                        }
                      },
                    ),
                    Text('곱셈'),
                    Switch(
                      value: switchMul,
                      onChanged: (value) {
                        setState(() {
                          switchMul = value;
                        });
                        if(switchMul){
                            setState(() {
                              resultMul.text = (num1 * num2).toString();
                            });
                        }else{
                            setState(() {
                              resultMul.text = "";
                            });
                        }
                      },
                    ),
                    Text('나눗셈'),
                    Switch(
                      value: switchDiv,
                      onChanged: (value) {
                        setState(() {
                          switchDiv = value;
                        });
                        if(switchDiv){
                          setState(() {
                              resultDiv.text = ((num1 / num2).toStringAsFixed(2)).toString();
                            });
                          }else{
                            setState(() {
                              resultDiv.text = "";
                            });
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                ),
                TextField(
                  // 읽기 전용
                  readOnly: true,
                  controller: resultAdd,
                  decoration: const InputDecoration(labelText: '덧셈 결과'),
                ),
                TextField(
                  readOnly: true,
                  controller: resultSub,
                  decoration: const InputDecoration(labelText: '뺄셈 결과'),
                ),
                TextField(
                  readOnly: true,
                  controller: resultMul,
                  decoration: const InputDecoration(labelText: '곱셈 결과'),
                ),
                TextField(
                  readOnly: true,
                  controller: resultDiv,
                  decoration: const InputDecoration(labelText: '나눗셈 결과'),
                ),
              ],
            ),
          ),
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
