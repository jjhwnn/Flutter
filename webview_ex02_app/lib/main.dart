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
  bool isLoading = true; // for indicator
  String siteName = 'www.daum.net';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(
          child: Column(
            children: [
              const Text('WebView'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: () {
                      setState(() {
                        siteName = 'www.google.com';
                      });
                      _reloadSite();
                    },
                    child: const Text('Google'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.green)),
                    onPressed: () {
                      setState(() {
                        siteName = 'www.naver.com';
                      });
                      _reloadSite();
                    },
                    child: const Text('Naver'),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue)),
                    onPressed: () {
                      setState(() {
                        siteName = 'www.daum.net';
                      });
                      _reloadSite();
                    },
                    child: const Text('Daum'),
                  ),
                ],
              ),

            ],
          ),
        ),
        toolbarHeight: 100,
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
              return Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      foregroundColor: Colors.black,
                      child: const Icon(Icons.arrow_back),
                      backgr
                      oundColor: Colors.redAccent,
                      onPressed: () {
                        controller.data!.goBack(); // 데이터가 있을수도 없을수도 있기 때문
                      }),
                      const SizedBox(
                        width: 10,
                      ),
                    FloatingActionButton(
                      foregroundColor: Colors.black,
                      child: const Icon(Icons.replay),
                      backgroundColor: Colors.amber,
                      onPressed: () {
                        controller.data!.reload(); // 새로고침
                      }),
                      const SizedBox(
                        width: 10,
                      ),
                    FloatingActionButton(
                      foregroundColor: Colors.black,
                      child: const Icon(Icons.arrow_forward),
                      backgroundColor: Colors.blue,
                      onPressed: () {
                        controller.data!.goForward(); // 데이터가 있을수도 없을수도 있기 때문
                      }),
                  ],
                ),
              );
            }
            return Stack();
          }),
    );
  }

  // 사이트 주소정보 반영
  _reloadSite() {
    _controller.future.then((value) => value.loadUrl('https://$siteName'));
  }
}
