import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Track {
  final CollectionReference _packageCollection =
      FirebaseFirestore.instance.collection('Package');

  Future<DocumentSnapshot> getPackageById(String trackingNumber) async {
    return await _packageCollection.doc(trackingNumber).get();
  }

  Future<void> addPackage(String trackingNumber, String status) async {
    await _packageCollection.add({
      'trackingNumber': trackingNumber,
      'status': status,
    });
  }

  Future<void> updatePackage(String trackingNumber, String status) async {
    await _packageCollection.doc(trackingNumber).update({
      'trackingNumber': trackingNumber,
      'status': status,
    });
  }

  Future<void> deletePackage(String trackingNumber) async {
    await _packageCollection.doc(trackingNumber).delete();
  }
}

