import 'package:flutter/material.dart';
import 'package:lastfirebase/src/pallete.dart';

class ImportPage extends StatefulWidget {
  const ImportPage({Key? key}) : super(key: key);

  @override
  State<ImportPage> createState() => _ImportPageState();
}

class _ImportPageState extends State<ImportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        iconTheme: IconThemeData(color: itemColor),
        title: Text(
          "Import new devices",
          style: TextStyle(
              color: itemColor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
