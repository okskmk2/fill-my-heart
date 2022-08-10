import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Vase {
  late String title;
  late String? authorId;
  late String receiveUID;
  late String dueDateTime;
  late String publicLinkUrl;
  late String status;
}

class VaseService extends ChangeNotifier {
  late final Vase vase;

  VaseService() {
    vase = Vase();
  }

  void setTitle(title) {
    vase.title = title;
  }

  void setReceiveUID(String receiveUID) {
    vase.receiveUID = receiveUID;
  }

  void setDueDateTime(String dueDateTime) {
    // datetimeformat e.g. 2022-02-03 21:11:21
    vase.dueDateTime = dueDateTime;
  }

  void addVase() {
    FirebaseFirestore.instance.collection('vase').add({
      'title': vase.title,
      'receiveUID': vase.receiveUID,
      'dueDateTime': vase.dueDateTime,
      'authorId': FirebaseAuth.instance.currentUser?.email,
      'status': 'before-send'
    }).then((res) {
      print(res);
      print("성공확인");
    });
  }

  void setPublicLinkUrl(String publicLinkUrl) {
    vase.publicLinkUrl = publicLinkUrl;
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getMyVase() async {
    return FirebaseFirestore.instance
        .collection('vase')
        .where('authorId', isEqualTo: FirebaseAuth.instance.currentUser!.email)
        .get();
  }
}
