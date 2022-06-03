import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_testt/services/firebase_auth_manager.dart';
import 'package:firebase_auth_testt/widgets/elevated_button_widget.dart';
import 'package:firebase_auth_testt/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';

import '../utils/app_constants.dart';

class SignUpWithEmailPassword extends StatelessWidget {
  const SignUpWithEmailPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void signupWithEmailPassword() async {
      await FirebaseAuthManager(FirebaseAuth.instance).signupWithEmailPassword(
          email: emailController.text,
          password: passwordController.text,
          context: context);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Register with email password')),
      body: Padding(
        padding: AppConstants().defaultHorizontalPadding,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Register",
            style: Theme.of(context).textTheme.headline5,
          ),
          AppConstants().defaultVerticalSizedBox,
          TextFormFieldWidget(
              inputType: TextInputType.emailAddress,
              prefixIcon: const Icon(Icons.email_outlined),
              hintText: 'Email',
              controller: emailController),
          AppConstants().defaultVerticalSizedBox,
          TextFormFieldWidget(
              inputType: TextInputType.text,
              isPassword: true,
              prefixIcon: const Icon(Icons.password_outlined),
              hintText: 'Password',
              controller: passwordController),
          AppConstants().mediumVerticalSizedBox,
          ElevatedButtonWidged(
              buttonText: 'Register Now', onPressed: signupWithEmailPassword)
        ]),
      ),
    );
  }
}
