import 'package:flutter/material.dart';
import 'package:freelance_serial/usb_serial_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'USB Serial to Webview Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const USBSerialCheckerPage(),
    );
  }
}
