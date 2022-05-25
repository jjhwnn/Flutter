import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app_02/Vol1/message.dart';

class Controller extends StatefulWidget {
  const Controller({Key? key}) : super(key: key);

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  late String switchLabel;
  late String switchColorLabel;

  late bool switchValue;
  late bool switchColor;

  @override
  void initState() {
    super.initState();
    if(Message.lampColor){
      switchColorLabel = "Yellow";
      switchColor = true;
    }else{
      switchColorLabel = 'Red';
      switchColor = false;
    }

    if(Message.lampStatus){
      switchLabel = "On";
      switchValue = true;
    }else{
      switchLabel = "Off";
      switchValue = false;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정 화면'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(switchColorLabel),
                Switch(
                  value: switchColor, 
                  onChanged: (value){
                    setState(() {
                      switchColor = value;
                      if(value){
                        switchColorLabel = "Yellow";
                      }else{
                        switchColorLabel = "Red";
                      }
                    });
                  })
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(switchLabel),
                Switch(
                  value: switchValue, 
                  onChanged: (value){
                    setState(() {
                      switchValue = value;
                      if(value){
                        switchLabel = "On";
                      }else{
                        switchLabel = "Off";
                      }
                    });
                  })
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Message.lampStatus = switchValue;
                Message.lampColor = switchColor;
                Navigator.pop(context);
              }, 
              child: const Text('OK'))
          ],
        ),
      ),
    );
  }
}