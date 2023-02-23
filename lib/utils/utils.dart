import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Utils {
  static showToastMessage(
      String message, BuildContext context, VoidCallback? dismiss) {
    final snackbar = SnackBar(
      content: Text(message),
      action: SnackBarAction(label: "dismiss", onPressed: dismiss!),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static dismissKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
