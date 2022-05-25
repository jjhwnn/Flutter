import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:navigator_lamp_switch_app/vol1/message.dart';

class UpdatePage extends StatefulWidget {
  final String imagePath;

  const UpdatePage({Key? key, required this.imagePath}) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late bool switchOnOff;
  late bool switchColor;

  @override
  void initState() {
    switchOnOff = true;
    switchColor = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(Lamp.switchColor ? Lamp.switchColorButton = 'Yellow' : Lamp.switchColorButton = 'Red'),
              Switch(
                  value: Lamp.switchColor,
                  onChanged: (value) {
                    setState(() {
                      Lamp.switchColor = value;
                    });
                  }),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(Lamp.switchOnOff ? Lamp.switchOnOffButton = 'Off' : Lamp.switchOnOffButton = 'On'),
              Switch(
                  value: Lamp.switchOnOff,
                  onChanged: (value) {
                    setState(() {
                      Lamp.switchOnOff = value;
                    });
                  }),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _changeLamp();
                Navigator.pop(context);
              });
            },
            child: const Text('OK'),
          ),
        ],
      )),
    );
  }

  _changeLamp() {
    setState(() {
      if (Lamp.switchOnOff) {
        if (Lamp.switchColor) {
          Lamp.imagePath = 'images/lamp_red.png';
        } else {
          Lamp.imagePath = 'images/lamp_on.png';
        }
      } else {
        Lamp.imagePath = 'images/lamp_off.png';
      }
    });
  }


}
