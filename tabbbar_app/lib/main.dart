import 'package:flutter/material.dart';
import 'package:tabbbar_app/first_page.dart';
import 'package:tabbbar_app/second_page.dart';

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

// 상속 여러개 상속받고 싶을때 with사용
class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // property
  late TabController controller;

  @override
  void initState() {
    super.initState(); // 사용할 탭 개수,
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose(); // 앱이 종료될 떄 정리되는 메서드
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Tab Bar Test'),
      // ),
      body: TabBarView(
        controller: controller,
        children: const [FirstPage(), SecondPage()],
      ),
      bottomNavigationBar: Container(
        color: Colors.yellow,
        child: TabBar(
            controller: controller,
            labelColor: Colors.blueAccent,
            indicatorColor: Colors.red,
            tabs: const [
              Tab(
                icon: Icon(
                  Icons.looks_one,
                  color: Colors.blue,

                ),
                text: "One",
              ),
              Tab(
                icon: Icon(
                  Icons.looks_two,
                  color: Colors.red,
                ),
                text: "Two",
              )

            ]),
      ),
    );
  }
}
