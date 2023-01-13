import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:usb_serial/usb_serial.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late WebViewController _controller;

  final domainName = 'https://flutter.dev';

  void _webViewData() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(domainName));
  }

  @override
  void initState() {
    super.initState();

    _webViewData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.delayed(
          Duration(seconds: 5),
          (() => ''),
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return WebViewWidget(
              controller: _controller,
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
