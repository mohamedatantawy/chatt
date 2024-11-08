import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:develp/constant.dart';
import 'package:develp/models/massagsModels.dart';
import 'package:flutter/material.dart';

class chatBuble extends StatelessWidget {
  const chatBuble({super.key, required this.massage});

  final Massagsmodels massage;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: kprimaycolor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Text(
          massage.massage,
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class chatBublef extends StatelessWidget {
  const chatBublef({super.key, required this.massage});

  final Massagsmodels massage;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: const EdgeInsets.all(12),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 110, 167, 213),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Text(
          massage.massage,
          style:const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
