// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lastfirebase/pages/import_page.dart';
import 'package:lastfirebase/pages/login_screen.dart';
import 'package:lastfirebase/pages/settings_page.dart';

import 'package:lastfirebase/src/pallete.dart';

import 'function/retrieve_data/getData.dart';
import 'model/RQ35K_model.dart';

List<PT_RQ35K> listRQ35K = [];

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
      options: const FirebaseOptions(
    apiKey: 'AIzaSyCETu6saW9NNv5-4_ttNUD7T_j-oS19w6Q',
    appId: '1:549212009977:web:6b9c433d2666d98cac7928',
    messagingSenderId: '549212009977',
    projectId: 'storage-product-2a98d',
  ));
  listRQ35K = await getDataRQ35K();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome!',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Pallete.backgroundColor,
      ),
      home: LoginScreen(),
      // home: ImportPage(),
      // home: SettingsPage(),
    );
  }
}
