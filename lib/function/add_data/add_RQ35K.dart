import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/RQ35K_model.dart';

Future<void> addData() async {
  try {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    DateTime now = DateTime.now();
    CollectionReference PT_RQ35K_Projector = _firestore
        .collection('Products')
        .doc('OlOfRiKhsA1PYTYSlOyg')
        .collection('PT-RQ35K');

    PT_RQ35K product = PT_RQ35K(
      No: 7,
      Projector: 'HEX VN',
      Projector_Serial_Number: 'SE2530003',
      IP_Address: '192.168.1.181',
      Light_source_hours: '16',
      Projector_hours: '16',
      Main_SW_ver: '1.15',
      Card: ['Dual link DVI', 'HDMI', 'Blank'],
      Country_of_Loan: 'VIET NAM',
      Date_Import: '${now.day}/${now.month}/${now.year}',
    );

    // Convert the product object to a Map using the toMap method in your model class
    Map<String, dynamic> productData = product.toFirestore();

    // Add the data to Firestore
    await PT_RQ35K_Projector.add(productData);

    print('Data added to Firestore with auto-generated ID');
  } catch (e) {
    print('Error adding data: $e');
  }
}

