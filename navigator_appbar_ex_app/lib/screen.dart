import 'package:flutter/material.dart';
import 'package:navigator_appbar_ex_app/receivedMail.dart';
import 'package:navigator_appbar_ex_app/sendMail.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigator_AppBar'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SendMail(),
                ),
              );
            },
            icon: Icon(Icons.email),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => receivedMail(),
                ),
              );
            },
            icon: Icon(Icons.email_outlined),
          ),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SendMail(),
                ),
              );
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green)),
            child: const Text('보낸 편지함'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => receivedMail(),
                ),
              );
            },
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red)),
            child: const Text('받은 편지함'),
          ),
        ],
      )),
    );
  }
}
