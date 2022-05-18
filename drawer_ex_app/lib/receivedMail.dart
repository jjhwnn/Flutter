import 'package:flutter/material.dart';

class receivedMail extends StatelessWidget {
  const receivedMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Received Mail'),
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 50,
          ),
          Text('유비에게서 온 메일\n관우에게서 온 메일\n장비에게서 온 메일\n')
        ],
      ),
    );
  }
}
