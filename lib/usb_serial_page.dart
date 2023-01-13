import 'package:flutter/material.dart';
import 'package:usb_serial/usb_serial.dart';

class USBSerialCheckerPage extends StatefulWidget {
  const USBSerialCheckerPage({super.key});

  @override
  State<USBSerialCheckerPage> createState() => _USBSerialCheckerPageState();
}

class _USBSerialCheckerPageState extends State<USBSerialCheckerPage> {
  String _currentStatus = 'Not Connected';
  bool _readyToOpenPort = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('USB Serial Page'),
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
                    _readyToOpenPort = true;
                  });
                }
                UsbPort? port;
                if (_readyToOpenPort == true) {
                  port = await devices[0].create();
                  bool openResult = await port!.open();
                  if (!openResult) {
                    setState(() {
                      _currentStatus = 'Failed to Open Port';
                    });
                  }
                  await port.setDTR(true);
                  await port.setRTS(true);
                }
              },

              // Get the usb serial data by read
              // Then pass the data to widget WebView_Page
            ),
            const SizedBox(height: 24),
            Text(_currentStatus),
          ],
        ),
      ),
    );
  }
}
