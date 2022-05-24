import 'package:flutter/material.dart';
import 'package:listview_todo_app/view/detail_list.dart';
import 'package:listview_todo_app/model/message.dart';
import 'package:listview_todo_app/model/todo_list.dart';

class TableList extends StatefulWidget {
  const TableList({Key? key}) : super(key: key);

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  // TodoList 배열 생성
  List<TodoList> todoList = [];

  @override
  void initState() {
    super.initState();
    todoList.add(TodoList(imagePath: 'images/cart.png', workList: '책구매'));
    todoList.add(TodoList(imagePath: 'images/clock.png', workList: '철수와 약속'));
    todoList
        .add(TodoList(imagePath: 'images/pencil.png', workList: '스터디 준비하기'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Main View'),
        actions: [
          IconButton(
            onPressed: () {
              // insert페이지 다녀온 후 다시 돌아올때 사용하는 메서드
              Navigator.pushNamed(context, '/insert')
                  .then((value) => rebuildData());
            },
            icon: const Icon(
              Icons.add_outlined,
            ),
          ),
        ],
      ),
      body: Center(
        child: ListView.builder(
            itemCount: todoList.length, // 리스트 개수만큼 반복해줌***
            itemBuilder: (context, position) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 3, 10, 3),
                child: GestureDetector(
                  onTap: () {
                    Message.imagePath = todoList[position].imagePath;
                    Message.workList = todoList[position].workList;
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const DetailList(),
                        ));
                  },
                  child: Card(
                    color: position % 2 == 0
                        ? const Color.fromARGB(255, 9, 189, 239)
                        : const Color.fromARGB(255, 9, 236, 176),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            todoList[position].imagePath,
                            width: 100,
                            height: 100,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(todoList[position].workList)
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  // -- Function
  rebuildData() {
    setState(() {
      if(Message.action){

      todoList.add(
        TodoList(imagePath: Message.imagePath, workList: Message.workList),
      );
      Message.action = false;
      }
    });
  }
}
