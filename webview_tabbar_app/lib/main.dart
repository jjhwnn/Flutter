import 'package:flutter/material.dart';
import 'package:webview_app/webpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
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
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
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
        title: const Text('WebView - Tabbar'),
      ),
      body: TabBarView(
        controller: controller,
        children: const [
          // 파라미터로 url을 넘겨줌
          WebPage(url: 'www.naver.com'),
          WebPage(url: 'www.google.com'),
          WebPage(url: 'www.daum.net'),
        ],
      ),
      bottomNavigationBar: Container(
        child: TabBar(
          controller: controller,
          labelColor: Colors.black,
          tabs: [
            Tab(
              icon: Image.asset(
                'images/naver.png',
                height: 30,
                width: 30,
              ),
              text: 'Naver',
              
            ),
            Tab(
              icon:  Image.asset(
                'images/google.png',
                height: 30,
                width: 30,
              ),
              text: 'Google',
            ),
            Tab(
              icon: Image.asset(
                'images/daum.png',
                height: 30,
                width: 30,
              ),
              text: 'Daum',
            ),
          ],
        ),
      ),
    );
  }
}
