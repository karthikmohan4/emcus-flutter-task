import 'package:flutter/material.dart';

class Snack {
  static pop(BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      showCloseIcon: true,
    ));
  }
}
