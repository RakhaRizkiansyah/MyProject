import 'package:flutter/material.dart';
import 'package:listviw/page/profile_page.dart';
import 'package:listviw/page/menu_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPage = 0;
  bool _dialogShown = false;

  final List<Widget> _pages = [ProfilePage(), MenuPage()];

  @override
  void initState() {
    super.initState();

    // Tunda dialog agar muncul setelah build selesai
    Future.delayed(Duration.zero, () {
      if (!_dialogShown) {
        _dialogShown = true;
        _showWelcomeDialog();
      }
    });
  }

  void _showWelcomeDialog() {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text('Selamat Datang'),
            content: Text('Kamu berhasil login ke aplikasi.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentPage],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: currentPage,
        onTap: (index) {
          setState(() {
            currentPage = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.orange.shade400,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.list),
            title: Text("List"),
            selectedColor: Colors.orange.shade400,
          ),
        ],
      ),
    );
  }
}
