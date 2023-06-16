import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class User {
  final String uid;
  final String name;

  User(this.uid, this.name);
}

class UserConverter {
  static User? fromFirebaseUser(User? firebaseUser) {
    if (firebaseUser == null) return null;
    return User(firebaseUser.uid, firebaseUser.name);
  }
}



