import 'package:flutter/material.dart';

class AsyncTaskPage extends StatefulWidget {
  @override
  _AsyncTaskPageState createState() => _AsyncTaskPageState();
}

class _AsyncTaskPageState extends State<AsyncTaskPage> {
  String result = "Menunggu...";

  Future<void> _runAsyncTask() async {
    setState(() => result = "Sedang memproses...");
    await Future.delayed(Duration(seconds: 3)); // Simulasi delay
    setState(() => result = "Tugas selesai setelah 3 detik!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AsyncTask Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(result),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _runAsyncTask,
              child: Text("Jalankan Async Task"),
            ),
          ],
        ),
      ),
    );
  }
}
