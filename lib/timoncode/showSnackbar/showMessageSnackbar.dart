import 'package:flutter/material.dart';

void showMessageSnackbar(String text,BuildContext context) {
  final snackBar = SnackBar(
    duration: Duration(milliseconds: 1500),
    content: Text(text),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}