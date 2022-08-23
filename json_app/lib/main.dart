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

  @override
  void initState() {
    super.initState();
    data = [];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON Test'),
      ),
      body: Center(
        child: data.isEmpty
            ? const Text('데이터가 없습니다.')
            : ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Code:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                // 리스트 내에서는 Map형태로 표현되어 번호 접근X
                                data[index]['code'],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Name:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                data[index]['name'],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Dept:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                data[index]['dept'],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text(
                                'Phone:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                data[index]['phone'],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  // -- Functions           비동기 방식
  Future<bool> getJSONData() async {
    // window는 ip어드레스 적어주어야 한다***
    // Mac
    // var url = Uri.parse('http://localhost:8080/Flutter/student_query_flutter.jsp');

    // Windows
    var url =
        Uri.parse('http://172.30.1.7:8080/Flutter/student_query_flutter.jsp');
    var response = await http.get(url); // get방식을 많이사용 -> 사용 후 암호화

    // 화면구성이 되었을 때 setState를 사용해준다.
    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON['results'];
      // result value의 해당 데이터 2개를 가져옴

      data.addAll(result);
    });
    print(data[0]['code']);
    return true;
  }
}
