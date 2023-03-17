import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }
  Future<void> init() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    notifyListeners();
  }

  Future<DocumentReference> addStoryToDb(Map story) {
    return FirebaseFirestore.instance
        .collection('stories')
        .add(<String, dynamic>{
      'title': story['title'],
      'story': story['body'],
      'count': story['count'],
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });
  }
}
