import 'package:flutter/material.dart';

// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ConnectToFirebase {
  CollectionReference lyrics = FirebaseFirestore.instance.collection('Быстрые');

  Future<DocumentSnapshot<Object?>> addUser() {
    print('HHHHIIIIII');
    // Call the user's CollectionReference to add a new user
    return lyrics.doc('Быстрые').get();
    // .add({
    //   'full_name': fullName, // John Doe
    //   'company': company, // Stokes and Sons
    //   'age': age // 42
    // })
    // .then((value) => print("User Added"))
    // .catchError((error) => print("Failed to add user: $error"));
  }
}
