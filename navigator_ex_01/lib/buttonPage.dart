import 'package:flutter/material.dart';
import 'package:navigator_ex_01/pikachu.dart';
import 'package:navigator_ex_01/pikachu2.dart';

class ButtonPage extends StatelessWidget {
const ButtonPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : const Text("Pikachuu"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const pikachu2(),));
              },
               child: const Text('가라 피카츄 백만볼트으')
               ),
            ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const pikachu1(),));
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red)
          ),
            child: const Text('피카피캎킾츄')
            ),

          ],
        ),

      ),

    );
  }
}