import 'package:flutter/material.dart';

class CheckboxPage extends StatefulWidget {
  const CheckboxPage({Key? key}) : super(key: key);

  @override
  State<CheckboxPage> createState() => _CheckboxPageState();
}

class _CheckboxPageState extends State<CheckboxPage> {
  bool isGameChecked = true;
  bool isHobbyChecked = true;

  List<String> gameList = [
    'Honkai Star:Rail',
    'Wuthering Waves',
    'Monster Hunter World',
  ];

  List<String> hobbyList = ['Game', 'Photography', 'Music'];

  // Menghasilkan list widget berdasarkan checkbox yang dipilih
  List<Widget> getSelectedMenu() {
    List<String> selectedMenu = [];

    if (isGameChecked) {
      selectedMenu.addAll(gameList);
    }
    if (isHobbyChecked) {
      selectedMenu.addAll(hobbyList);
    }

    if (selectedMenu.isEmpty) {
      return [const Text('Belum ada menu yang dipilih.')];
    }

    return selectedMenu
        .map(
          (item) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text('- $item', style: const TextStyle(fontSize: 16)),
          ),
        )
        .toList();
  }

  // Mengubah judul berdasarkan checkbox
  String getMenuTitle() {
    if (isGameChecked && isHobbyChecked) {
      return 'My Game || My Hobby';
    } else if (isGameChecked) {
      return 'My Game';
    } else if (isHobbyChecked) {
      return 'My Hobby';
    } else {
      return 'Menu';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDF5FF), // Warna background
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text('About Me'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Checkbox 1
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: CheckboxListTile(
                value: isGameChecked,
                onChanged: (value) {
                  setState(() {
                    isGameChecked = value!;
                  });
                },
                title: const Text('My Game'),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),

            // Checkbox 2
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: CheckboxListTile(
                value: isHobbyChecked,
                onChanged: (value) {
                  setState(() {
                    isHobbyChecked = value!;
                  });
                },
                title: const Text('My Hobby'),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ),

            const SizedBox(height: 20),

            // Judul Menu
            Text(
              getMenuTitle(),
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Menampilkan daftar menu (List ke bawah)
            Expanded(child: ListView(children: getSelectedMenu())),
          ],
        ),
      ),
    );
  }
}
