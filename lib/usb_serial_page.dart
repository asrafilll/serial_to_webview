import 'package:flutter/material.dart';
import 'package:usb_serial/usb_serial.dart';

class TesPage extends StatelessWidget {
  const TesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('tes'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Column(
            children: const [
              Text('Check Ports'),
            ],
          ),
          onPressed: () async {
            List<UsbDevice> devices = await UsbSerial.listDevices();
            if (devices.isEmpty) {
              print('is Empty');
            }
            if (devices.isNotEmpty) {
              print(devices);
            }
          },

          // Get the usb serial data by read
          // Then pass the data to widget WebView_Page
        ),
      ),
    );
  }
}
