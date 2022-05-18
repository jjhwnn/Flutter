import 'package:flutter/material.dart';
import 'package:navigator_appbar_ex_app/receivedMail.dart';
import 'package:navigator_appbar_ex_app/screen.dart';
import 'package:navigator_appbar_ex_app/sendMail.dart';

void main() {
  runApp(const MyApp());
}


// initialRoute를 사용한다면, home프로퍼티를 정의하지 마세요.

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 루트의 시작점을 정의
     initialRoute: '/',
     // 이용가능한 named route와 해당 route로 이동했을 때 빌드될 위젯을 정의
     routes: {
       '/' :(context) => const Home(),
       '/send' :(context) => const SendMail(),
       '/received' :(context) => const receivedMail()
     },
    );
  }
}

