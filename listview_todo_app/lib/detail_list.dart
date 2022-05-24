
import 'package:flutter/material.dart';
import 'package:listview_todo_app/message.dart';
import 'package:listview_todo_app/todo_list.dart';

class DetailList extends StatefulWidget {
  const DetailList({Key? key}) : super(key: key);

  @override
  State<DetailList> createState() => _DetailListState();
}

class _DetailListState extends State<DetailList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Message.workList),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Message.imagePath,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              Message.workList,
              style: const TextStyle(
                fontSize: 40,
                ),
            ),
          ],
        ),
      ),
    );
  }
}