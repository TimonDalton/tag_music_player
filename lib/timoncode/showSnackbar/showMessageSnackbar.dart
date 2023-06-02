import 'package:flutter/material.dart';

void showMessageSnackbar(String text,BuildContext context,{int? duration_ms}) {
  final snackBar = SnackBar(
    duration: Duration(milliseconds: duration_ms!= null?duration_ms:1500),
    content: Text(text),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}