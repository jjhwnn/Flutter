import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  // 메인에서 url 주소 받아오기
  final String url;
  const WebPage({Key? key, required this.url}) : super(key: key);

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  final Completer<WebViewController> _controller =
        Completer<WebViewController>();
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebView(
            initialUrl: 'https://${widget.url}',
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
    );
  }
}