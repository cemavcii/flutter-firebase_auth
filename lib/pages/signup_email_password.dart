import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_testt/services/firebase_auth_manager.dart';
import 'package:firebase_auth_testt/widgets/elevated_button_widget.dart';
import 'package:firebase_auth_testt/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';

class SignUpWithEmailPassword extends StatefulWidget {
  const SignUpWithEmailPassword({Key? key}) : super(key: key);

  @override
  State<SignUpWithEmailPassword> createState() =>
      _SignUpWithEmailPasswordState();
}

class _SignUpWithEmailPasswordState extends State<SignUpWithEmailPassword> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void signupWithEmailPassword() async {
    await FirebaseAuthManager(FirebaseAuth.instance).signupWithEmailPassword(
        email: _emailController.text,
        password: _passwordController.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register with email password')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Register",
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormFieldWidget(
              prefixIcon: const Icon(Icons.email_outlined),
              hintText: 'Email',
              controller: _emailController),
          const SizedBox(
            height: 20,
          ),
          TextFormFieldWidget(
              prefixIcon: const Icon(Icons.password_outlined),
              hintText: 'Password',
              controller: _passwordController),
          const SizedBox(
            height: 30,
          ),
          ElevatedButtonWidged(
              buttonText: 'Register Now', onPressed: signupWithEmailPassword)
        ]),
      ),
    );
  }
}
