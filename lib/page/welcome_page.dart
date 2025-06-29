import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:listviw/page/login_page.dart';
import 'package:listviw/page/register_page.dart';
import 'package:listviw/style/color.dart';
import 'package:listviw/widget/theme_notifier.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    final isDarkMode = themeNotifier.themeMode == ThemeMode.dark;

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: isDarkMode ? Colors.black : backgroundColor1,
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: size.height * 0.53,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  color: primaryColor,
                  image: const DecorationImage(
                    image: NetworkImage("https://i.imgur.com/N3gxT5T.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: size.height * 0.55,
              left: 0,
              right: 0,
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Selamat Datang Di \n Website Rakha",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: isDarkMode ? Colors.white : textColor1,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Silahkan Register/Login Untuk Melanjutkan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: isDarkMode ? Colors.grey[300] : textColor2,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        height: size.height * 0.08,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: backgroundColor3.withOpacity(0.9),
                          border: Border.all(color: Colors.white),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withOpacity(0.05),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: const Offset(0, -1),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: Row(
                            children: [
                              Container(
                                height: size.height * 0.08,
                                width: size.width / 2.2,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RegisterPage(),
                                      ),
                                    );
                                  },
                                  child: Center(
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: textColor1,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginPage(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: textColor1,
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Tombol toggle tema opsional
                    IconButton(
                      icon: Icon(
                        isDarkMode ? Icons.wb_sunny : Icons.dark_mode,
                        color: isDarkMode ? Colors.yellow : Colors.black,
                      ),
                      onPressed: () {
                        themeNotifier.toggleTheme();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
