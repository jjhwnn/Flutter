import 'package:flutter/material.dart';
import 'package:listview_ex_insert_app/country.dart';

class SecondPage extends StatefulWidget {
  final List<Country> list;
  const SecondPage({Key? key, required this.list}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final controller = TextEditingController();
  String _imagePath = "";
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
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(labelText: '정답을 입력하세요'),
                keyboardType: TextInputType.text,
                maxLines: 1,
              ),
            ),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      _imagePath = "images/korea.png";
                      setState(() {
                        imageName = "대한민국";
                      });
                    },
                    child: Image.asset(
                      'images/korea.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = "images/austria.png";
                      setState(() {
                        imageName = "오스트리아";
                      });
                    },
                    child: Image.asset(
                      'images/austria.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = "images/belgium.png";
                      setState(() {
                        imageName = "벨기에";
                      });
                    },
                    child: Image.asset(
                      'images/belgium.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = "images/estonia.png";
                      setState(() {
                        imageName = "에스토니아";
                      });
                    },
                    child: Image.asset(
                      'images/estonia.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = "images/france.png";
                      setState(() {
                        imageName = "프랑스";
                      });
                    },
                    child: Image.asset(
                      'images/france.png',
                      width: 80,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _imagePath = "images/germany.png";
                      setState(() {
                        imageName = "독일";
                      });
                    },
                    child: Image.asset(
                      'images/germany.png',
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
                var country = Country(
                    countryImagePath:_imagePath,
                     countryName: controller.text);

                AlertDialog dialog = AlertDialog(
                  title: const Text('문제 추가하기'),
                  content: Text('이 국기의 문제는 ${country.countryName} 입니다. \n'
                      '이 문제를 추가하시겠습니까?\n'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        widget.list.add(country);
                        Navigator.of(context).pop();
                      },
                      child: const Text('예'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('아니요'),
                    ),
                  ],
                );
                showDialog(
                  context: context,
                   builder: (BuildContext context){
                     return dialog;
                   });
              },
              child: const Text('문제 추가하기'),
            ),
          ],
        ),
      ),
    );
  }
}
