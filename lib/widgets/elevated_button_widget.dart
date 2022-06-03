import 'package:flutter/material.dart';

class ElevatedButtonWidged extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  const ElevatedButtonWidged(
      {Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(buttonText),
          ),
        ),
      ],
    );
  }
}
