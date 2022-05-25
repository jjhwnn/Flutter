import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigator_lamp_app/message.dart';

class UpdatePage extends StatefulWidget {
  const UpdatePage({Key? key}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    textEditingController.text = Lamp.text;

    // 메인에서 변경된 전구온오프 스위치에 반영하기
    if(Lamp.lampImage == 'images/lamp_on.png'){
      Lamp.switchValue = true;
    }else{
      Lamp.switchValue = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textEditingController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(Lamp.switchValue ? 'Off' : 'On'),
                  Switch(
                      value: Lamp.switchValue,
                      onChanged: (value) {
                        setState(() {
                          Lamp.switchValue = value;
                        });
                      }),
                ],
              ),
               ElevatedButton(
                    onPressed: () {
                      // 전구 온오프, 텍스트 수정 메서드
                      _update();
                      Navigator.pop(context);
                    },
                    child: const Text('OK'),
                  ),
            ],
          ),
        ),
      ),
    );
  }

// switch값, 입력된 텍스트 수정한 값 반영
  _update(){
    setState(() {
      if(Lamp.switchValue){
        Lamp.lampImage = 'images/lamp_on.png';
      }else{
        Lamp.lampImage = 'images/lamp_off.png';
      }
      // 다시 수정한 텍스트 값을 Lamp객체의 텍스트에 대입
      Lamp.text = textEditingController.text;
    });
  }

}
