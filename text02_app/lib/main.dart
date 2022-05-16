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
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Demo Home Page')),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.email_rounded),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.account_balance),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.account_circle,),
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('James'),
                ),

                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Cathy',),
                ),

                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('Kenny'),
                ),
              ],
            ),
          ),
          
        ]),
      ),
    );
  }
}
