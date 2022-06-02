import 'package:flutter/material.dart';

class NavigatorUtils {
  void pushNext(BuildContext context, Widget route) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => route),
    );
  }
}
