import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text('영웅 Card'),

      ),

      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const Center(
              child: CircleAvatar(
                
                foregroundImage: AssetImage('images/Lee.jpg'),
                radius: 50,
              ),
            ),
            const Divider(    // 선 그리기
                height: 30,
                color: Colors.grey,
                thickness: 1.5,
            ),
            const Text(
            '성웅',
            style: TextStyle(
              color: Colors.white
            ),
            ),
            const Text(
            '이순신 장군',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            ),
            const Text(
            '전적',
            style: TextStyle(
            color: Colors.white,
            ),
            ),
           const Text(
            '62전 62승',
            style: TextStyle(
            color: Colors.red,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            ),
            ), 
            
          Row(
            children: [
               Column(
              children: const [
              
                Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.check_circle_outline),
                ),
                Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.check_circle_outline),
                ),
                Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.check_circle_outline),
                ),
                Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.check_circle_outline),
                ),
                Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.check_circle_outline),
                ),
                Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.check_circle_outline),
                ),
              ],

            ),
 

            const Text(
              '옥포해전 \n 사천포해전 \n 당포해전 \n 한산도대첩 \n 부산포해전 \n 명량해전 \n 노량해전',
            ),

            ],

          ),  
           
            const CircleAvatar(
              
              backgroundColor: Colors.orange,
              foregroundImage: AssetImage('images/turtle.gif'),
            )
            

          ],

        ),
      )

    );
  }
}