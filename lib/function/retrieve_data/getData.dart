import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/RQ35K_model.dart';

Future<List<PT_RQ35K>> getDataRQ35K() async {
  List<PT_RQ35K> listAdd = [];
  FirebaseFirestore db = FirebaseFirestore.instance;

  try {
    var querySnapshot = await db
        .collection("Products")
        .doc("OlOfRiKhsA1PYTYSlOyg")
        .collection('PT-RQ35K')
        .get();

    print("Successfully completed");

    for (var doc in querySnapshot.docs) {
      listAdd.add(PT_RQ35K(
        No: doc.data()['No'],
        Projector: doc.data()['Projector'] ?? '',
        Projector_Serial_Number: doc.data()['Projector S/N'] ?? '',
        IP_Address: doc.data()['IP Address'] ?? '',
        Light_source_hours: doc.data()['Light source hours'] ?? '',
        Projector_hours: doc.data()['Projector hours'] ?? '',
        Main_SW_ver: doc.data()['Main SW ver'] ?? '',
        Card: doc.data()['Card'] ?? '',
        Country_of_Loan: doc.data()['Country of Loan'] ?? '',
        Date_Import: doc.data()['Date Import'] ?? '',
      ));
    }

    // Sort the list based on the "No" field
    listAdd.sort((a, b) => a.No.compareTo(b.No));

    return listAdd;
  } catch (e) {
    print("Error completing: $e");
    // Handle the error appropriately, you might want to throw or return an error object
    throw e;
  }
}
