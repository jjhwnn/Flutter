import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({Key? key}) : super(key: key);

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  late TextEditingController textEditingController;
  late bool switchCart;
  late bool switchClock;
  late bool switchPencil;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
    switchCart = true;
    switchClock = false;
    switchPencil = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add View'),
      ),
      body: Center(
          child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('구매'),
                  Switch(
                      value: switchCart,
                      onChanged: (value) {
                        setState(() {
                          switchCart = value;
                          if(switchCart){
                            switchClock = false;
                            switchPencil = false;
                          }
                        });
                      }),
                  Image.asset('images/cart.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('약속'),
                  Switch(
                      value: switchClock,
                      onChanged: (value) {
                        setState(() {
                          switchClock = value;
                          if(switchClock){
                            switchCart = false;
                            switchPencil = false;
                          }
                        });
                      }),
                  Image.asset('images/clock.png'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('스터디'),
                  Switch(
                      value: switchPencil,
                      onChanged: (value) {
                        setState(() {
                          switchPencil = value;
                          if(switchPencil){
                            switchCart = false;
                            switchClock = false;
                          }
                        });
                      }),
                  Image.asset('images/pencil.png'),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          TextField(
            controller: textEditingController,
            decoration: const InputDecoration(
              labelText: '목록을 입력 하세요',
            ),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            onPressed: () {
              if (textEditingController.text.trim().isNotEmpty) {
                addList();
              }
              Navigator.pop(context);
            },
            child: const Text(
              'OK',
            ),
          ),
        ],
      )),
    );
  }

  // -- Functions
  addList() {
    if(switchCart){
      Message.imagePath = "images/cart.png";
    }else if(switchClock){
      Message.imagePath = "images/clock.png";
    }else{
      Message.imagePath = "images/pencil.png";
    }
    Message.workList = textEditingController.text;
    Message.action = true;
  }

  // cart아이콘 디폴트
  // 중복선택 불가능..
  // 아이콘 선택시 해당아이콘 업로드 되야함



}
