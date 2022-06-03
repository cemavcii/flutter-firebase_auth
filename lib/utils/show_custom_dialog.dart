import 'package:flutter/material.dart';

void showCustomDialog(
    {required BuildContext context,
    required TextEditingController tokenController,
    required VoidCallback onPressed}) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
            title: const Text("Enter your token"),
            content: TextFormField(
              controller: tokenController,
            ),
            actions: [
              ElevatedButton(onPressed: onPressed, child: const Text("Submit"))
            ],
          ));
}
