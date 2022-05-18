import 'package:flutter/material.dart';

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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer'),
      ),
      body: const Center(
        child: Text('Drawer'),
      ),
      // 메뉴바 내부
      drawer: Drawer(
        child: ListView(
          // 메뉴바를 꽉채워줌
          padding: EdgeInsets.zero,
          children: [
            // 메뉴바 내부 헤더
             const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/pikachu-1.jpg'),
              ),
              otherAccountsPictures: [
                CircleAvatar(
                    backgroundImage: AssetImage('images/pikachu-2.jpg')),
                CircleAvatar(
                    backgroundImage: AssetImage('images/pikachu-3.jpg')),
              ],
              accountName: Text('Pikachu'),
              accountEmail: Text('pikachu@naver.com'),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)
                ),
              ),
            ),
            ListTile(
              onTap: () {
                
              },
              leading: const Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: const Text('Home'),
              trailing: const Icon(
                Icons.add,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
