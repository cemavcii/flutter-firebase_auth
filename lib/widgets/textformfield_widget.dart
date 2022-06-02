import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final Icon prefixIcon;
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;

  const TextFormFieldWidget(
      {Key? key,
      required this.prefixIcon,
      required this.hintText,
      required this.controller,
      this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(90.0)),
          ),
          filled: true,
          hintText: hintText),
    );
  }
}
