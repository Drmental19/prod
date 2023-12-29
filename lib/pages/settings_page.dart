// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:lastfirebase/src/pallete.dart';

bool isDarkMode = true;

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String selectedLanguage = 'English';

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
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 35.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Change theme',
              style: TextStyle(
                  color: itemColor, fontSize: 20, fontWeight: FontWeight.w500),
            ),
            // change theme button
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 35),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    isDarkMode = !isDarkMode;
                    if (backGroundColor == darkBackground) {
                      backGroundColor = lightBackground;
                    } else {
                      backGroundColor = darkBackground;
                    }
                    if (itemColor == itemColorInDark) {
                      itemColor = itemColorInLight;
                    } else {
                      itemColor = itemColorInDark;
                    }
                    if (appBarColor == darkAppbar) {
                      appBarColor = lightAppbar;
                    } else {
                      appBarColor = darkAppbar;
                    }
                    if (resItemColor == darkResItem) {
                      resItemColor = lightResItem;
                    } else {
                      resItemColor = darkResItem;
                    }
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: resItemColor,
                ),
                child: Text(
                  isDarkMode ? 'Switch to Light mode' : 'Switch to Dark mode',
                  style: TextStyle(color: itemColor),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Language',
              style: TextStyle(
                  color: itemColor, fontSize: 20, fontWeight: FontWeight.w500),
            ),
            // change language button
            Padding(
              padding: const EdgeInsets.only(
                left: 60,
                top: 10,
              ),
              child: DropdownButton<String>(
                value: selectedLanguage,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLanguage = newValue!;
                  });

                  // Implement language change logic here
                },
                style: TextStyle(color: itemColor, fontSize: 17),
                dropdownColor: backGroundColor,
                items: <String>['English', 'Vietnamese']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
