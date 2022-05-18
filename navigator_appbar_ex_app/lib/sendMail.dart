import 'package:flutter/material.dart';

class SendMail extends StatelessWidget {
  const SendMail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Send Mail'),
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 50,
          ),
          Text('유비에게 보낸 메일\n관우에게 보낸 메일\n장비에게 보낸 메일 \n'),
        ],
      ),
    );
  }
}
