import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/show_snackbar.dart';

class FirebaseAuthManager {
  final FirebaseAuth _auth;
  FirebaseAuthManager(this._auth);

// Login
  Future<void> signinWithEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message);
    }
  }

//Register
  Future<void> signupWithEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      await sendEmailVerification(context);
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message);
    }
  }

  Future<void> sendEmailVerification(BuildContext context) async {
    try {
      await _auth.currentUser!.sendEmailVerification();
      showSnackbar(context, 'Email verification sent');
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message);
    }
  }
}
