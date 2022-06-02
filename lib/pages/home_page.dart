import 'package:firebase_auth_testt/pages/signin_email_password_view.dart';
import 'package:firebase_auth_testt/pages/signup_email_password.dart';
import 'package:firebase_auth_testt/utils/navigator.dart';
import 'package:firebase_auth_testt/widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firebase Auth Home Screen')),
      body: Column(
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
        ],
      ),
    );
  }
}
