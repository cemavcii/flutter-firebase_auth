import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_testt/services/firebase_auth_manager.dart';
import 'package:firebase_auth_testt/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/elevated_button_widget.dart';

class PhoneSigninView extends StatefulWidget {
  const PhoneSigninView({Key? key}) : super(key: key);

  @override
  State<PhoneSigninView> createState() => _PhoneSigninViewState();
}

class _PhoneSigninViewState extends State<PhoneSigninView> {
  final TextEditingController _phoneController = TextEditingController();

  void signinWithPhone() {
    FirebaseAuthManager(FirebaseAuth.instance)
        .signinWithPhoneNumber(context, _phoneController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login with your phone number"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Login",
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            height: 20,
          ),
          TextFormFieldWidget(
              prefixIcon: const Icon(Icons.phone),
              hintText: 'Phone number',
              controller: _phoneController),
          const SizedBox(
            height: 20,
          ),
          ElevatedButtonWidged(
            onPressed: signinWithPhone,
            buttonText: "Login now",
          )
        ]),
      ),
    );
  }
}
