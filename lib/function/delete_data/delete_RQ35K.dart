import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../firebase/firebase_options.dart';

class YourScreen extends StatelessWidget {
  // Replace these with your actual values
  final String collectionName = 'Products';
  final String documentId = 'OlOfRiKhsA1PYTYSlOyg';
  final String subCollectionName = 'PT-RQ35K';
  final int targetId = 7;

  Future<void> deleteDocuments() async {
    try {
      // Reference to the sub-collection
      CollectionReference subCollectionRef = FirebaseFirestore.instance
          .collection(collectionName)
          .doc(documentId)
          .collection(subCollectionName);

      // Query to get documents with ID equal to 7
      QuerySnapshot querySnapshot =
      await subCollectionRef.where('No', isEqualTo: targetId).get();

      // Delete each document
      for (QueryDocumentSnapshot document in querySnapshot.docs) {
        await document.reference.delete();
        print('Document with ID ${document.id} deleted successfully.');
      }
    } catch (e) {
      print('Error deleting documents: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firestore Delete Example'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: deleteDocuments,
          child: Text('Delete Documents'),
        ),
      ),
    );
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    //     options: const FirebaseOptions(
    //   apiKey: 'AIzaSyCETu6saW9NNv5-4_ttNUD7T_j-oS19w6Q',
    //   appId: '1:549212009977:web:6b9c433d2666d98cac7928',
    //   messagingSenderId: '549212009977',
    //   projectId: 'storage-product-2a98d',
    // )
  );
  runApp(MaterialApp(
    home: YourScreen(),
  ));
}
