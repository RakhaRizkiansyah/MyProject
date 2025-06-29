import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class SmsAutofillPage extends StatefulWidget {
  const SmsAutofillPage({super.key});

  @override
  State<SmsAutofillPage> createState() => _SmsAutofillPageState();
}

class _SmsAutofillPageState extends State<SmsAutofillPage> with CodeAutoFill {
  String? _code;

  @override
  void initState() {
    super.initState();
    listenForCode();
  }

  @override
  void codeUpdated() {
    setState(() {
      _code = code;
    });
  }

  @override
  void dispose() {
    cancel();
    super.dispose();
  }

  void _submitCode() {
    if (_code != null && _code!.length == 6) {
      // Lakukan validasi atau submit
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Kode berhasil: $_code")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Kode belum lengkap")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SMS Autofill")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text("Masukkan Kode OTP:", style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            PinFieldAutoFill(
              codeLength: 6,
              onCodeChanged: (val) {
                _code = val;
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _submitCode, child: Text("Verifikasi")),
          ],
        ),
      ),
    );
  }
}
