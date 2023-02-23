import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future signout() async {
    await _firebaseAuth.signOut();
  }

  Future createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    {
      _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
    }
  }
}
