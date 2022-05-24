import 'package:flutter/material.dart';
import 'package:listview_ex_insert_app/country.dart';
import 'package:listview_ex_insert_app/first_page.dart';
import 'package:listview_ex_insert_app/second_page.dart';


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
  with SingleTickerProviderStateMixin {
    late TabController controller;
    List<Country> countryList = [];

    @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    countryList.add(
      Country(
        countryImagePath: 'images/austria.png',
        countryName: '오스트리아'),
    );
    countryList.add(
      Country(
        countryImagePath: 'images/belgium.png',
        countryName: '벨기에'),
    );
    countryList.add(
      Country(
        countryImagePath: 'images/estonia.png',
        countryName: '에스토니아'),
    );
    countryList.add(
      Country(
        countryImagePath: 'images/france.png',
        countryName: '프랑스'),
    );
    countryList.add(
      Country(
        countryImagePath: 'images/germany.png',
        countryName: '독일'),
    );
    countryList.add(
      Country(
        countryImagePath: 'images/hungary.png',
        countryName: '헝가리'),
    );
    countryList.add(
      Country(
        countryImagePath: 'images/italy.png',
        countryName: '이탈리아'),
    );
    countryList.add(
      Country(
        countryImagePath: 'images/latvia.png',
        countryName: '라트비아'),
    );
    countryList.add(
      Country(
        countryImagePath: 'images/lithuania.png',
        countryName: '리투아니아'),
    );
    countryList.add(
      Country(
        countryImagePath: 'images/luxemburg.png',
        countryName: '룩셈부르크'),
    );
    countryList.add(
      Country(
        countryImagePath: 'images/netherland.png',
        countryName: '네덜란드'),
    );
    countryList.add(
      Country(
        countryImagePath: 'images/romania.png',
        countryName: '에스토니아'),
    );
    countryList.add(
      Country(
        countryImagePath: 'images/estonia.png',
        countryName: '에스토니아'),
    );
    
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
        title: const Text('국가명 맞추기'),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          FirstPage(list: countryList),
          SecondPage(list: countryList)],
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
