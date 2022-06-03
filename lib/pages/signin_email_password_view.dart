import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_testt/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';

import '../services/firebase_auth_manager.dart';
import '../utils/app_constants.dart';
import '../widgets/elevated_button_widget.dart';

class SigninWithEmailPasswordView extends StatelessWidget {
  const SigninWithEmailPasswordView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    void signinWithEmailPassword() async {
      await FirebaseAuthManager(FirebaseAuth.instance).signinWithEmailPassword(
          email: emailController.text,
          password: passwordController.text,
          context: context);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Login with email password')),
      body: Padding(
        padding: AppConstants().defaultHorizontalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: Theme.of(context).textTheme.headline5,
            ),
            AppConstants().defaultVerticalSizedBox,
            TextFormFieldWidget(
                inputType: TextInputType.emailAddress,
                controller: emailController,
                prefixIcon: const Icon(Icons.email_outlined),
                hintText: 'Email'),
            AppConstants().defaultVerticalSizedBox,
            TextFormFieldWidget(
                inputType: TextInputType.text,
                isPassword: true,
                controller: passwordController,
                prefixIcon: const Icon(Icons.password_outlined),
                hintText: 'Password'),
            AppConstants().mediumVerticalSizedBox,
            ElevatedButtonWidged(
              onPressed: signinWithEmailPassword,
              buttonText: "Login Now",
            )
          ],
        ),
      ),
    );
  }
}
