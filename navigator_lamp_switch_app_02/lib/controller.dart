import 'package:flutter/material.dart';

class Controller extends StatefulWidget {
  final bool lampColor;
  final bool lampStatus;

  const Controller({Key? key, required this.lampColor, required this.lampStatus}) : super(key: key);

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  late String switchLabel;
  late String switchColorLabel;

  late bool switchValue;
  late bool switchColor;

  List status = [];

  @override
  void initState() {
    super.initState();
    if(widget.lampColor){
      switchColorLabel = "Yellow";
      switchColor = true;
    }else{
      switchColorLabel = 'Red';
      switchColor = false;
    }

    if(widget.lampStatus){
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
                status.add(switchValue);
                status.add(switchColor);
                Navigator.pop(context, status);
              }, 
              child: const Text('OK'))
          ],
        ),
      ),
    );
  }
}