import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SecondPage> {
  // Property

  // 이미지 파일네임
  late List imageName;

  // 이미지 리스트 인덱스 번호
  late int currentImage;

  @override
  void initState() {
    imageName = [
      'flower_01.png',
      'flower_02.png',
      'flower_03.png',
      'flower_04.png',
      'flower_05.png',
      'flower_06.png'
    ];

    currentImage = 0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        title: const Text('Image Swiping'),
      ),
      body: SimpleGestureDetector(
        // 좌우로 스와이프
        onHorizontalSwipe: _onHorizontalSwipe,
        onVerticalSwipe: _onVerticalSwipe,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              // 이미지 네임
              imageName[currentImage],
            ),
            Image.asset(
              'images/${imageName[currentImage]}',
              width: 350,
              height: 600,
            )
          ],
        )),
      ),
    );
  }

  // -- Functions
  _onHorizontalSwipe(SwipeDirection direction) {
    setState(() {
      // 왼쪽으로 스와이프 할때
      if (direction == SwipeDirection.left) {
        currentImage += 1;
        // 이미지가 범위를 넘겼을때 첫 이미지로 이동
        if (currentImage >= imageName.length) {
          currentImage = 0;
        }
      } else {
        currentImage -= 1;
        // 첫 이미지보다 뒤로 이동할 때 맨 뒤 이미지 불러들이기
        if (currentImage < 0) {
          currentImage = imageName.length - 1;
        }
      }
    });
  }

  _onVerticalSwipe(SwipeDirection direction) {
    setState(() {
      // 스와이프를 밑으로 했을때
      if (direction == SwipeDirection.down) {
        currentImage += 1;
        // 이미지가 범위를 넘겼을때 첫 이미지로 이동
        if (currentImage >= imageName.length) {
          currentImage = 0;
        }
      } else {
        currentImage -= 1;
        // 첫 이미지보다 뒤로 이동할 때 맨 뒤 이미지 불러들이기
        if (currentImage < 0) {
          currentImage = imageName.length - 1;
        }
      }
    });
  }
}
