import 'package:flutter/material.dart';
import 'package:lastfirebase/src/pallete.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String selectedSetting = "Main Content";

  void handleSettingTap(String setting) {
    setState(() {
      selectedSetting = setting;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        iconTheme: IconThemeData(color: itemColor),
        title: Text(
          "Settings",
          style: TextStyle(
              color: itemColor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: Row(
        children: [
          Container(
            width: 180, // Đặt chiều rộng của ô dọc
            color: resItemColor, // Đặt màu nền của ô dọc
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    'Change theme',
                    style: TextStyle(color: itemColor),
                  ),
                  onTap: () {
                    // Handle account settings
                    setState(() {
                      print('object');
                      // handleSettingTap('Change theme');
                    });
                  },
                ),
                ListTile(
                  title: Text(
                    'Language',
                    style: TextStyle(color: itemColor),
                  ),
                  onTap: () {
                    // Handle notification settings
                  },
                ),
              ],
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('Main Content'),
            ),
          ),
        ],
      ),
    );
  }
}
