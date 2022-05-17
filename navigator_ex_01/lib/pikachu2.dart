
import 'package:flutter/material.dart';

class pikachu2 extends StatelessWidget {
  const pikachu2 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Image Ex01'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // 사진 하나만 사용되어서 row() 클래스가 굳이 필요없다(사용시 퍼포먼스 저하)
          const CircleAvatar(
            backgroundImage: AssetImage('images/pikachu-1.jpg'),
            radius: 50,   // 반지름
          ),
      
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-2.jpg'),
                radius: 50,
              ),
              SizedBox(
                width: 20,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-3.jpg'),
                radius: 50,
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}