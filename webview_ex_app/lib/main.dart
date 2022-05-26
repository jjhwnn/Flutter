import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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

class _MyHomePageState extends State<MyHomePage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  bool isLoading = true;
  String siteName = 'www.daum.net';
  late TextEditingController search;

  @override
  void initState() {
    search = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: search,
              decoration: const InputDecoration(labelText: 'Site이름을 입력하세요!'),
              keyboardType: TextInputType.text,
            ),
          ),
          actions: [
             GestureDetector(
               onTap: () {
                 setState(() {
                   siteName = search.text;
                   _reloadSite();
                 });
               },
               child: const Padding(
                 padding: EdgeInsets.all(8.0),
                 child: Icon(
                   Icons.search
                   ),
               ),
            ),
          ],
        ),
        body: Stack(
        children: [
          WebView(
            initialUrl: 'https://$siteName',
            javascriptMode: JavascriptMode.unrestricted, // 자바스크립트 제한없이 사용
            onWebViewCreated: (WebViewController webViewController) {
              _controller.complete(webViewController);
            },
            // 페이지 종료
            onPageFinished: (finish) {
              setState(() {
                isLoading = false;
              });
            },
            // 페이지 시작
            onPageStarted: (start) {
              setState(() {
                isLoading = true;
              });
            },
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(),
        ],
      ),
      floatingActionButton: FutureBuilder<WebViewController>(
          future: _controller.future,
          builder: (BuildContext context,
              AsyncSnapshot<WebViewController> controller) {
            if (controller.hasData) {
              return FloatingActionButton(
                  child: const Icon(Icons.arrow_back),
                  backgroundColor: Colors.redAccent,
                  onPressed: () {
                    controller.data!.goBack(); // 데이터가 있을수도 없을수도 있기 때문
                  });
            }
            return Stack();
          }),
      ),
    );
  }
  // 사이트 불러오는 메서드
  _reloadSite() {
    _controller.future.then((value) => value.loadUrl('https://$siteName'));
  }

}