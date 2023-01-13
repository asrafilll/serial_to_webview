import 'package:flutter/material.dart';
import 'package:usb_serial/usb_serial.dart';

class TesPage extends StatefulWidget {
  const TesPage({super.key});

  @override
  State<TesPage> createState() => _TesPageState();
}

class _TesPageState extends State<TesPage> {
  String _currentStatus = 'Not Connected';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('tes'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Check Ports'),

              onPressed: () async {
                List<UsbDevice> devices = await UsbSerial.listDevices();
                if (devices.isEmpty) {
                  setState(() {
                    _currentStatus = 'Devices is Empty';
                  });
                }
                if (devices.isNotEmpty) {
                  setState(() {
                    _currentStatus = 'Devices are detected : $devices';
                  });
                }
                // UsbPort? port;
                // port = await devices[0].create();
                // bool openResult = await port!.open();
                // if (!openResult) {
                //   const Text('Failed to Open Port');
                //   return;
                // }
                // await port.setDTR(true);
                // await port.setRTS(true);
              },

              // Get the usb serial data by read
              // Then pass the data to widget WebView_Page
            ),
            Text(_currentStatus),
          ],
        ),
      ),
    );
  }
}
