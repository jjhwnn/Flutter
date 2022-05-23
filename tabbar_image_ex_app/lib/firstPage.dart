import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<FirstPage> {
  late List imageFile;
  late int currentPage;

  @override
  void initState() {
    super.initState();
    imageFile = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png',
    ];

    currentPage = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('무한 이미지 반복'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  imageFile[currentPage],
                  style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 10,
                        ),
                      ),
                      child: Image.asset(
                        'images/${imageFile[currentPage]}',
                        width: 400,
                        height: 500,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  // 해당 위치에 사진을 위치시켜줌
                  Positioned(
                    left: 290,
                    top: 16,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.amber,
                          width: 5
                        )
                      ),
                      child: Image.asset(
                                  // 페이지수가 최대 페이지보다 클때 제일 처음페이지 반환 아니면 정상페이지 반환
                        'images/${currentPage+1 == imageFile.length ? imageFile[0] : imageFile[currentPage+1]}',
                        fit: BoxFit.fill,
                        width: 100,
                        height: 150,
                      ),
                    ),
                  ),
                  // 전 페이지 사진 보이게 만들기
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          prevButton();
                        });
                      },
                      child: const Text('<< 이전'),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          nextButton();
                        });
                      },
                      child: const Text('다음 >>'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // --- Functions
  nextButton() {
    currentPage++;
    if (currentPage >= imageFile.length) {
      currentPage = 0;
    }
  }

  prevButton() {
    currentPage--;
    if (currentPage < 0) {
      currentPage = imageFile.length - 1;
    }
  }
} // End
