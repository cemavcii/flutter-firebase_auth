import 'package:firebase_auth_testt/services/firebase_auth_manager.dart';
import 'package:firebase_auth_testt/widgets/elevated_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoggedInView extends StatelessWidget {
  const LoggedInView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = context.read<FirebaseAuthManager>().userData;

    return Scaffold(
      appBar: AppBar(title: const Text('Logged in')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!user.isAnonymous && user.phoneNumber == null) Text(user.email!),
          if (!user.isAnonymous && user.phoneNumber == null)
            Text(user.providerData[0].providerId),
          if (user.phoneNumber != null) Text(user.phoneNumber!),
          Text("Your user id is ${user.uid}"),
          if (!user.emailVerified && !user.isAnonymous)
            ElevatedButtonWidged(
              onPressed: () {
                context
                    .read<FirebaseAuthManager>()
                    .sendEmailVerification(context);
              },
              buttonText: 'Verify Email',
            ),
          ElevatedButtonWidged(
            onPressed: () {
              context.read<FirebaseAuthManager>().logout(context);
            },
            buttonText: 'Sign Out',
          ),
          ElevatedButtonWidged(
            onPressed: () {
              context.read<FirebaseAuthManager>().deleteAccount(context);
            },
            buttonText: 'Delete Account',
          ),
        ],
      ),
    );
  }
}
