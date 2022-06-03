import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../utils/show_custom_dialog.dart';
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

  //Register with phone number. only works on ios and androids
  Future<void> signinWithPhoneNumber(
      BuildContext context, String phoneNumber) async {
    TextEditingController tokenController = TextEditingController();
    await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          _auth.signInWithCredential(credential);
        },
        verificationFailed: (e) {
          showSnackbar(context, e.message);
        },
        codeSent: ((String verificationId, int? token) async {
          showCustomDialog(
            tokenController: tokenController,
            context: context,
            onPressed: () async {
              PhoneAuthCredential credential = PhoneAuthProvider.credential(
                verificationId: verificationId,
                smsCode: tokenController.text.trim(),
              );

              await _auth.signInWithCredential(credential);
              //removes dialog
              Navigator.of(context).pop();
            },
          );
        }),
        codeAutoRetrievalTimeout: (String verificationId) {});
  }

  Future<void> signinWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        await _auth.signInWithCredential(credential);
      }
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message);
    }
  }
}
