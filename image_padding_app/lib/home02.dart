
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_padding_app/main.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Image Padding"
        ),
      ),
      body: SingleChildScrollView(  // 스크롤 기능
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset(
          'images/pikachu-1.jpg',
              width: 200,
              height: 200,
          ),
            ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
            'images/pikachu-2.jpg',
              width: 200,
              height: 200,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(
            'images/pikachu-3.jpg',
              width: 200,
              height: 200,
            ),
          ),

        ],)
        
      ),
    );
  }
}