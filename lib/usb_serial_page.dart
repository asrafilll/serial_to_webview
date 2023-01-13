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
              const Text('No Devices');
            }
            if (devices.isNotEmpty) {
              Text('Devices are detected : $devices');
            }
            UsbPort? port;
            port = await devices[0].create();
            bool openResult = await port!.open();
            if (!openResult) {
              const Text('Failed to Open Port');
              return;
            }
            await port.setDTR(true);
            await port.setRTS(true);
          },

          // Get the usb serial data by read
          // Then pass the data to widget WebView_Page
        ),
      ),
    );
  }
}
