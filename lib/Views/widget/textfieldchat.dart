import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:develp/constant.dart';
import 'package:develp/cubit/chatcubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Textfieldchat extends StatelessWidget {

  TextEditingController controller = TextEditingController();
  ScrollController controller1 = ScrollController();
  Textfieldchat({super.key, required this.controller1});
  @override
  Widget build(BuildContext context) {
   String  email= ModalRoute.of(context)!.settings.arguments as String ;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextField(
        controller: controller,
        onSubmitted: (value) {
          BlocProvider.of<ChatCubit>(context)
              .sendmassage(massages: value, email: email);
          controller.clear();
          if (controller1.hasClients) {
  controller1.animateTo(0,
      duration: Duration(seconds: 9), curve: Curves.easeIn);
}
        },
        decoration: InputDecoration(
            hintText: "sand",
            hintStyle: const TextStyle(
              fontSize: 22,
            ),
            border: basicoutline(),
            enabledBorder: basicoutline(),
            focusedBorder: basicoutline(),
            suffixIcon: Icon(
              Icons.send,
              color: kprimaycolor,
            )),
      ),
    );
  }

  OutlineInputBorder basicoutline() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: kprimaycolor),
    );
  }
}
