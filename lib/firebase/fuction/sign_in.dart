import 'package:cloud_firestore/cloud_firestore.dart';

import 'dart:async';

Future<bool> check_sign_in(String email, String password) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  CollectionReference usersRef = firestore.collection('User');
  Query query = usersRef
      .where('UserName', isEqualTo: email)
      .where('Password', isEqualTo: password);
  print(email);
  print(password);

  try {
    QuerySnapshot querySnapshot = await query.get();
    // Nếu có kết quả, trả về true
    if (querySnapshot.docs.isNotEmpty) {
      return true;
    } else {
      print('Invalid');
      return false;
    }
  } catch (e) {
    // Handle any potential errors here
    print('Error: $e');
    return false;
  }
}
