import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart'
    hide EmailAuthProvider, PhoneAuthProvider;

import 'package:bramble_project/src/classes/bramble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import '../../firebase_options.dart';

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }
  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;
  bool? _loading = false;
  bool? get loading => _loading;
  set loading(boolean) {
    _loading = boolean;
    notifyListeners();
  }

  StreamSubscription<QuerySnapshot>? _getBrambleSubscription;
  List<Bramble> _brambleList = [];
  List<Bramble> get brambleList => _brambleList;

  Future<void> init() async {
    FirebaseUIAuth.configureProviders([EmailAuthProvider()]);
    _loading = true;
    _brambleList = [];
    final snapshots = await getStories();
    for (final doc in snapshots.docs) {
      _brambleList
          .add(Bramble(title: doc.data()['title'], body: doc.data()['body']));
    }
    FirebaseAuth.instance.userChanges().listen((user) async {
      if (user != null) {
        _loggedIn = true;

        notifyListeners();
      } else {
        _loggedIn = false;
      }
      _loading = false;
      notifyListeners();
    });
  }

  Future<DocumentReference> addStoryToDb(Map story) async {
    return FirebaseFirestore.instance
        .collection('stories')
        .add(<String, dynamic>{
      'title': story['title'],
      'body': story['body'],
      'count': story['count'],
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getStories() async {
    return FirebaseFirestore.instance
        .collection('stories')
        .get()
        .then((snapshots) => snapshots);
  }

  addToList() async {
    _loading = true;
    _brambleList = [];
    final snapshots = await getStories();

    for (final doc in snapshots.docs) {
      _brambleList
          .add(Bramble(title: doc.data()['title'], body: doc.data()['body']));
    }

    notifyListeners();
    _loading = false;
  }

  tobeused() async {
    // _getBrambleSubscription = FirebaseFirestore.instance
    //     .collection('stories')
    //     .orderBy('timestamp', descending: true)
    //     .snapshots()
    //     .listen(
    //   (snapshot) {
    //     _loading = false;
    //     _brambleList = [];
    //     for (final document in snapshot.docs) {
    //       _brambleList.add(Bramble(
    //           title: document.data()['title'], body: document.data()['body']));
    //     }

    //     notifyListeners();
    //   },
    //   onError: (err) {},
    // );
  }
}
