import 'package:flutter/material.dart';
import 'package:listviw/page/googlemaps_page.dart';
import 'package:listviw/page/list_page.dart';
import 'package:listviw/page/checkbox_page.dart';
import 'package:listviw/page/autocomplete.dart';
import 'package:listviw/page/smsautofill_page.dart';
import 'package:listviw/page/welcome_page.dart';
import 'package:listviw/page/camera_page.dart';
import 'package:listviw/page/preference_page.dart';
import 'package:listviw/page/thread_page.dart';
import 'package:listviw/page/async_task_page.dart';
import 'package:listviw/page/chart_page.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu Utama"),
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.camera_alt),
            title: Text("Kamera"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CameraPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Preferensi"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => PreferencePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.location_pin),
            title: Text("Maps"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => GoogleMapsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("Pertemuan"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ListPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.check_box),
            title: Text("Checkbox"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CheckboxPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text("Autocomplete"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AutocompletePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.speed),
            title: Text("Thread"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ThreadPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.timelapse),
            title: Text("Async Task"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => AsyncTaskPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text("SMS Autofill"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SmsAutofillPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.show_chart),
            title: Text("Grafik"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ChartPage()),
              );
            },
          ),

          ListTile(
            leading: Icon(Icons.logout, color: Colors.red),
            title: Text("Logout", style: TextStyle(color: Colors.red)),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => WelcomePage()),
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}
