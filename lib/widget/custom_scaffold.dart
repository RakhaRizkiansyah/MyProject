import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  CustomScaffold({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            "assets/widget/test_bg.jpg",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
            errorBuilder: (context, error, stackTrace) {
              return Center(child: Text('Gagal memuat gambar'));
            },
          ),
          SafeArea(child: child!),
        ],
      ),
    );
  }
}
