import 'package:flutter/material.dart';
import 'package:lastfirebase/src/pallete.dart';

class ExportPage extends StatefulWidget {
  const ExportPage({Key? key}) : super(key: key);

  @override
  State<ExportPage> createState() => _ExportPageState();
}

class _ExportPageState extends State<ExportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColor,
      appBar: AppBar(
        backgroundColor: appBarColor,
        iconTheme: IconThemeData(color: itemColor),
        title: Text(
          "Export devices",
          style: TextStyle(
              color: itemColor, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
