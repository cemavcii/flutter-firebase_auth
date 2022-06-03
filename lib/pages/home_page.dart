import 'package:firebase_auth_testt/pages/phone_signin_view.dart';
import 'package:firebase_auth_testt/pages/signin_email_password_view.dart';
import 'package:firebase_auth_testt/pages/signup_email_password.dart';
import 'package:firebase_auth_testt/services/firebase_auth_manager.dart';
import 'package:firebase_auth_testt/utils/app_constants.dart';
import 'package:firebase_auth_testt/utils/navigator.dart';
import 'package:firebase_auth_testt/widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenView extends StatelessWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firebase Auth Home Screen')),
      body: Padding(
        padding: AppConstants().defaultHorizontalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButtonWidged(
                buttonText: 'Login with email password',
                onPressed: () {
                  NavigatorUtils()
                      .pushNext(context, const SigninWithEmailPasswordView());
                }),
            ElevatedButtonWidged(
                buttonText: 'Register with email password',
                onPressed: () {
                  NavigatorUtils()
                      .pushNext(context, const SignUpWithEmailPassword());
                }),
            ElevatedButtonWidged(
                buttonText: 'Login with phone number',
                onPressed: () {
                  NavigatorUtils().pushNext(context, const PhoneSigninView());
                }),
            ElevatedButtonWidged(
                buttonText: 'Login with Google account',
                onPressed: () {
                  context.read<FirebaseAuthManager>().signinWithGoogle(context);
                }),
            ElevatedButtonWidged(
                buttonText: 'Login anonymously',
                onPressed: () {
                  context
                      .read<FirebaseAuthManager>()
                      .signInAnonymously(context);
                }),
          ],
        ),
      ),
    );
  }
}
