import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:develp/Views/widget/chatBuble.dart';
import 'package:develp/Views/widget/chatView_body.dart';
import 'package:develp/Views/widget/textfieldchat.dart';
import 'package:develp/constant.dart';
import 'package:develp/cubit/chatcubit/chat_cubit.dart';
import 'package:develp/models/massagsModels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Chatview extends StatelessWidget {
  static String id = "chatView";
  List<Massagsmodels> massagelist = [];
  final controller = ScrollController();
  Chatview({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: kprimaycolor,
          title: const Text(
            'Chating',
            style: TextStyle(fontSize: 30),
          )),
      body:ChatviewBody(),
    );
  }
}
