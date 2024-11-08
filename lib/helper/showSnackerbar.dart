import 'package:flutter/material.dart';

void showsnackbar(BuildContext context, String massage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.blue,
      content: Text(massage),
    ),
  );
}
