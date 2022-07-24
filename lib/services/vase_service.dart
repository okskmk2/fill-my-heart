import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class VaseService extends ChangeNotifier {
  late final String title;
  late final String receiveUID;
  late final String dueDateTime;
  late final int maxMemberCount;
  late final String publicLinkUrl;
  void setTitle(title) {
    this.title = title;
  }

  void setReceiveUID(String receiveUID) {
    this.receiveUID = receiveUID;
  }

  void setDueDateTime(String dueDateTime) {
    // datetimeformat e.g. 2022-02-03 21:11:21
    this.dueDateTime = dueDateTime;
  }

  void setMaxMemberCount(int maxMemberCount) {
    this.maxMemberCount = maxMemberCount;
  }

  void addVase() {
    FirebaseFirestore.instance.collection('vase').add({
      'title': title,
      'receiveUID': receiveUID,
      'dueDateTime': dueDateTime,
      'maxMemberCount': maxMemberCount
    });
  }

  void setPublicLinkUrl(String publicLinkUrl) {
    this.publicLinkUrl = publicLinkUrl;
  }
}
