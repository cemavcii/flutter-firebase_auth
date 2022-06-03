import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_testt/services/firebase_auth_manager.dart';
import 'package:firebase_auth_testt/widgets/textformfield_widget.dart';
import 'package:flutter/material.dart';

import '../utils/app_constants.dart';
import '../widgets/elevated_button_widget.dart';

class PhoneSigninView extends StatelessWidget {
  const PhoneSigninView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();

    void signinWithPhone() {
      FirebaseAuthManager(FirebaseAuth.instance)
          .signinWithPhoneNumber(context, phoneController.text);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login with your phone number"),
      ),
      body: Padding(
        padding: AppConstants().defaultHorizontalPadding,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            "Login",
            style: Theme.of(context).textTheme.headline5,
          ),
          AppConstants().defaultVerticalSizedBox,
          TextFormFieldWidget(
              inputType: TextInputType.phone,
              prefixIcon: const Icon(Icons.phone),
              hintText: 'Phone number',
              controller: phoneController),
          AppConstants().defaultVerticalSizedBox,
          ElevatedButtonWidged(
            onPressed: signinWithPhone,
            buttonText: "Login now",
          )
        ]),
      ),
    );
  }
}
