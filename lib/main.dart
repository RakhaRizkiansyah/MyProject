import 'package:flutter/material.dart';

import 'package:listviw/page/welcome_page.dart';
import 'package:listviw/style/color.dart';
import 'package:provider/provider.dart';
import 'package:listviw/widget/theme_notifier.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (_) => ThemeNotifier(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);

    return MaterialApp(
      title: 'Aplikasi Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: backgroundColor1,
        fontFamily: 'Roboto',
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark, fontFamily: 'Roboto'),
      themeMode: themeNotifier.themeMode, // ← tambahan penting
      home: WelcomePage(),
    );
  }
}
