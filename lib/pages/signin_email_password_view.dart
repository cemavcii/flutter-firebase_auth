import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_testt/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';

import '../services/firebase_auth_manager.dart';
import '../widgets/elevated_button_widget.dart';

class SigninWithEmailPasswordView extends StatefulWidget {
  const SigninWithEmailPasswordView({Key? key}) : super(key: key);

  @override
  State<SigninWithEmailPasswordView> createState() =>
      _SigninWithEmailPasswordViewState();
}

class _SigninWithEmailPasswordViewState
    extends State<SigninWithEmailPasswordView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void signinWithEmailPassword() async {
    await FirebaseAuthManager(FirebaseAuth.instance).signinWithEmailPassword(
        email: _emailController.text,
        password: _passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login with email password')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Login",
              style: Theme.of(context).textTheme.headline5,
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormFieldWidget(
                controller: _emailController,
                prefixIcon: const Icon(Icons.email_outlined),
                hintText: 'Email'),
            const SizedBox(
              height: 20,
            ),
            TextFormFieldWidget(
                controller: _passwordController,
                prefixIcon: const Icon(Icons.password_outlined),
                hintText: 'Password'),
            const SizedBox(
              height: 30,
            ),
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
