import 'dart:html' as html;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  html.VideoElement? _videoElement;
  html.MediaStream? _stream;
  bool _cameraOn = false;

  @override
  void initState() {
    super.initState();

    // Registrasi platform view hanya sekali
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'webcam-view',
      (int viewId) => _videoElement ?? html.DivElement(),
    );
  }

  Future<void> _startCamera() async {
    try {
      _videoElement =
          html.VideoElement()
            ..autoplay = true
            ..muted = true
            ..style.width = '100%'
            ..style.height = '100%'
            ..style.objectFit = 'cover';

      _stream = await html.window.navigator.mediaDevices!.getUserMedia({
        'video': {'facingMode': 'user'},
      });

      _videoElement!.srcObject = _stream;

      setState(() => _cameraOn = true);
    } catch (e) {
      print("Error starting camera: $e");
    }
  }

  void _stopCamera() {
    _stream?.getTracks().forEach((track) => track.stop());
    _videoElement?.srcObject = null;
    _stream = null;
    _videoElement = null;
    setState(() => _cameraOn = false);
  }

  void _toggleCamera() {
    if (_cameraOn) {
      _stopCamera();
    } else {
      _startCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Camera Page")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black12,
              child:
                  _cameraOn
                      ? HtmlElementView(viewType: 'webcam-view')
                      : Center(child: Text("Kamera tidak aktif")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton.icon(
              onPressed: _toggleCamera,
              icon: Icon(_cameraOn ? Icons.videocam_off : Icons.videocam),
              label: Text(_cameraOn ? "Matikan Kamera" : "Nyalakan Kamera"),
            ),
          ),
        ],
      ),
    );
  }
}
