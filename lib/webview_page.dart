import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({
    Key? key,
    this.url,
  }) : super(key: key);

  final String? url;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late WebViewController _controller;

  late var domainName = widget.url;

  void _webViewData() {
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(Uri.parse(domainName ?? 'https://flutter.dev'));
  }

  @override
  void initState() {
    super.initState();

    _webViewData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: Future.delayed(
          const Duration(seconds: 5),
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
