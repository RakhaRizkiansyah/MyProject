import 'dart:isolate';
import 'package:flutter/material.dart';

class ThreadPage extends StatefulWidget {
  const ThreadPage({super.key});

  @override
  State<ThreadPage> createState() => _ThreadPageState();
}

class _ThreadPageState extends State<ThreadPage> {
  String _result = "Belum dijalankan";
  Isolate? _isolate;
  ReceivePort? _receivePort;

  void _startThread() async {
    _receivePort = ReceivePort();
    _isolate = await Isolate.spawn(_simpleTask, _receivePort!.sendPort);

    _receivePort!.listen((message) {
      setState(() {
        _result = message.toString();
      });

      _stopThread(); // langsung stop isolate setelah selesai
    });
  }

  static void _simpleTask(SendPort sendPort) {
    // Simulasi pekerjaan ringan
    int total = 0;
    for (int i = 0; i < 1000000; i++) {
      total += i;
    }
    sendPort.send("Hasil perhitungan: $total");
  }

  void _stopThread() {
    _receivePort?.close();
    _isolate?.kill(priority: Isolate.immediate);
    _isolate = null;
  }

  @override
  void dispose() {
    _stopThread();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Thread Ringan (Isolate)")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_result),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _startThread,
              child: Text("Jalankan Thread Ringan"),
            ),
          ],
        ),
      ),
    );
  }
}
