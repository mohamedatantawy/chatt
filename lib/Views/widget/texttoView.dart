import 'package:flutter/material.dart';

class Texttoview extends StatelessWidget {
  const Texttoview({super.key, required this.text, required this.num});
  final String text;
  final double num;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  TextStyle(
        fontWeight: FontWeight.bold,
        fontSize:num,
      ),
    );
  }
}
