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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Jenny",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Cathy",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Kenny",
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Jenny",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Cathy",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Kenny",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
