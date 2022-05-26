import 'dart:convert';

import 'package:flutter/material.dart';
// http settings
import 'package:http/http.dart' as http;

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
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List data;
  late Color cardColor;

  @override
  void initState() {
    super.initState();
    data = [];
    cardColor = Color.fromARGB(255, 149, 220, 152);
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 190, 195, 195),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 22, 180, 27),
        title: const Text('JSON Movie'),
      ),
      body: Center(
        child: data.isEmpty
            ? const Text('데이터가 없습니다.')
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: (){
                              //
                            },
                            child: Card(
                              color:  cardColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.network(
                                      data[index]['image'],
                                      height: 100,
                                      width: 100,
                                    ),
                                    Text(
                                      data[index]['title'],
                                      style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            color: cardColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.network(
                                    data[index]['image'],
                                    height: 100,
                                    width: 100,
                                  ),
                                  Text(
                                    data[index]['title'],
                                    style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 250,
                        width: data[index]['title'].length < 5 ? 250 : 200,
                        child: Card(
                              color:  cardColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.network(
                                      data[index]['image'],
                                      height: 100,
                                      width: 100,
                                    ),
                                    Text(
                                      data[index]['title'],
                                      style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }

  // -- Functions           비동기 방식
  Future<bool> getJSONData() async {
    var url = Uri.parse('https://zeushahn.github.io/Test/movies.json');
    var response = await http.get(url); // get방식을 많이사용 -> 사용 후 암호화

    // 화면구성이 되었을 때 setState를 사용해준다.
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON['results'];
      data.addAll(result);
    });
    print(data[0]['code']);
    return true;
  }
}
