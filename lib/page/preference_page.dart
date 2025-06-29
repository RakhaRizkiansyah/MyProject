import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:listviw/widget/theme_notifier.dart';

class PreferencePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    bool isDark = themeNotifier.themeMode == ThemeMode.dark;

    return Scaffold(
      appBar: AppBar(title: Text("Preferensi")),
      body: ListTile(
        leading: Icon(Icons.brightness_6),
        title: Text("Dark Mode"),
        trailing: Switch(
          value: isDark,
          onChanged: (val) {
            if (val) {
              themeNotifier.setDarkMode();
            } else {
              themeNotifier.setLightMode();
            }
          },
        ),
      ),
    );
  }
}
