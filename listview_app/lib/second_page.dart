import 'package:flutter/material.dart';
import 'package:listview_app/animal_item.dart';

class SecondPage extends StatefulWidget {
  final List<Animal> list;
  const SecondPage({Key? key, required this.list}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
// final키워드 추가시 바로 변수 생성 가능
  final nameController = TextEditingController();
  int _radioValue = 0;
  bool flyExist = false;
  var _imagePath;
  String imageName = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: nameController,
            keyboardType: TextInputType.text,
            maxLines: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Radio(
                value: 0,
                groupValue: _radioValue,
                onChanged: _radioChange,
              ),
              const Text('양서류'),
              Radio(
                value: 1,
                groupValue: _radioValue,
                onChanged: _radioChange,
              ),
              const Text('파충류'),
              Radio(
                value: 2,
                groupValue: _radioValue,
                onChanged: _radioChange,
              ),
              const Text('포유류'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('날 수 있나요?'),
              Checkbox(
                  value: flyExist,
                  onChanged: (check) {
                    setState(() {
                      flyExist = check!;
                    });
                    
                  }),
            ],
          ),
          Container(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () {
                    _imagePath = "images/cow.png";
                    setState(() {
                      imageName = "젖소";
                    });
                  },
                  child: Image.asset(
                    'images/cow.png',
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _imagePath = "images/pig.png";
                    setState(() {
                      imageName = "돼지";
                    });
                  },
                  child: Image.asset(
                    'images/pig.png',
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _imagePath = "images/bee.png";
                    setState(() {
                      imageName = "벌";
                    });
                  },
                  child: Image.asset(
                    'images/bee.png',
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _imagePath = "images/cat.png";
                    setState(() {
                      imageName = "고양이";
                    });
                  },
                  child: Image.asset(
                    'images/cat.png',
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _imagePath = "images/fox.png";
                    setState(() {
                      imageName = "여우";
                    });
                  },
                  child: Image.asset(
                    'images/fox.png',
                    width: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _imagePath = "images/monkey.png";
                    setState(() {
                      imageName = "원숭이";
                    });
                  },
                  child: Image.asset(
                    'images/monkey.png',
                    width: 80,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(imageName),
          ),
          ElevatedButton(
              onPressed: () {
                var animal = Animal(
                    animalName: nameController.text,
                    kind: getKind(_radioValue),
                    imagePath: _imagePath,
                    flyExist: flyExist);

                AlertDialog dialog = AlertDialog(
                  title: const Text('동물 추가하기'),
                  content: Text(
                    '이 동물은 ${animal.animalName} 입니다. \n'
                    '또 동물의 종류는 ${animal.kind} 입니다. \n'
                    '이 동물은 ${animal.flyExist ? "날 수 있습니다." : "날 수 없습니다."} \n'
                    '이 동물은 추가 하시겠습니까?',
                    style: const TextStyle(fontSize: 17),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        widget.list.add(animal);
                        Navigator.of(context).pop();
                      },
                      child: const Text('예'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        '아니오',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                );
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return dialog;
                    });
              },
              child: const Text('동물 추가하기'))
        ],
      )),
    );
  }

  // -- Function  null_safety : ?
  _radioChange(int? value) {
    setState(() {
      _radioValue = value!; // null부분을 해제 : !
    });
  }

  getKind(int radioValue) {
    switch (radioValue) {
      case 0:
        return '양서류';
      case 1:
        return '파충류';
      case 2:
        return '포유류';
    }
  }
}
