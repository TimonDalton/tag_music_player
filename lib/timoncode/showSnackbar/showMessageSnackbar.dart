import 'package:flutter/material.dart';

void showMessageSnackbar(String text, BuildContext context) {
  final snackBar = SnackBar(
    content: Text(text),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}