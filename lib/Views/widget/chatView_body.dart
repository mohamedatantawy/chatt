import 'package:develp/Views/widget/chatBuble.dart';
import 'package:develp/Views/widget/textfieldchat.dart';
import 'package:develp/cubit/chatcubit/chat_cubit.dart';
import 'package:develp/models/massagsModels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatviewBody extends StatelessWidget {
  List<Massagsmodels> massagelist = [];
  final controller = ScrollController();
  ScrollController controller1 = ScrollController();

  ChatviewBody({super.key});
  @override
  Widget build(BuildContext context) {
    String  email = ModalRoute.of(context)!.settings.arguments as String;
    return Column(
      children: [
        Expanded(
          child: BlocConsumer<ChatCubit, ChatState>(
            listener: (context, state) {
              if (state is ChatSucess) {
                massagelist = state.massage;
              }
            },
            builder: (context, state) {
              return ListView.builder(
                reverse: true,
                itemCount: massagelist.length,
                controller: controller,
                itemBuilder: (context, index) {
                  return email==massagelist[index].email? chatBuble(
                    massage: massagelist[index],
                  ):chatBublef(massage: massagelist[index]);
                },
              );
            },
          ),
        ),
        Textfieldchat(
          controller1: controller1,
        ),
      ],
    );
  }
}
