import 'package:develp/constant.dart';
import 'package:flutter/material.dart';

class Listtile extends StatelessWidget {
  const Listtile({super.key, required this.text, this.ontap});
  final String text;
 final VoidCallback? ontap;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      child: ListTile(
        
        onTap: ontap,
        title: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: kprimaycolor,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
