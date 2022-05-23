import 'package:flutter/material.dart';
import 'package:tabbar_image_ex_app/firstPage.dart';
import 'package:tabbar_image_ex_app/secondPage.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> 
with SingleTickerProviderStateMixin{

  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text('이미지 변경하기'),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          FirstPage(), SecondPage(),
        ],
      ),
        bottomNavigationBar: Container(
          color: Colors.yellow,
          child: TabBar(
            controller: controller,
            labelColor: Colors.blueAccent,
            indicatorColor: Colors.red,
            tabs: const[
              Tab(
                icon: Icon(
                  Icons.subway,
                  color: Colors.blue,
                ),
                text: 'Button',
              ),
              Tab(
                icon: Icon(
                  Icons.subway_outlined,
                  color: Colors.red,
                ),
                text: 'Swipe',
              ),
            ],
          ),
        ),
    );
  }
}