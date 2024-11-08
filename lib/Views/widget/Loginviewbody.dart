import 'package:develp/Views/RegisterView.dart';
import 'package:develp/Views/chatView.dart';
import 'package:develp/Views/widget/list_title.dart';
import 'package:develp/Views/widget/textFormfield.dart';
import 'package:develp/Views/widget/texttoView.dart';
import 'package:develp/bloc/auth_bloc.dart';
import 'package:develp/constant.dart';
import 'package:develp/cubit/chatcubit/chat_cubit.dart';
import 'package:develp/helper/showSnackerbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Loginviewbody extends StatelessWidget {
  String? email, password;
  bool obs = true;
  GlobalKey<FormState> formkey = GlobalKey();
  bool isloading = false;

  Loginviewbody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is Loginloading) {
          isloading = true;
        } else if (state is Loginsuccess) {
          isloading = false;
          BlocProvider.of<ChatCubit>(context).getmassages();
          Navigator.pushNamed(context, Chatview.id, arguments: email);
        } else if (state is Loginfailure) {
          isloading = false;
          showsnackbar(context, state.errormassage);
        }
      },
      builder: (context, state) => ModalProgressHUD(
        inAsyncCall: isloading,
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: ListView(
              children: [
                Image.asset(
                  kimage,
                  cacheHeight: 200,
                  height: 350,
                ),
                const Center(
                  child: Texttoview(
                    text: 'CHATING APP',
                    num: 40,
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Texttoview(text: 'Login', num: 40),
                ),
                Textfieldbody(
                    onsave: (value) {
                      email = value;
                    },
                    hint: 'Email'),
                const SizedBox(
                  height: 30,
                ),
                Textfieldbody(
                    obscure: obs,
                    ontap: () {
                      return;
                    },
                    onsave: (value) {
                      password = value;
                    },
                    hint: 'password'),
                const SizedBox(
                  height: 30,
                ),
                Listtile(
                  text: 'Login',
                  ontap: () async {
                    if (formkey.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context)
                          .add(LoginEvent(email: email!, password: password!));
                    }
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Texttoview(text: 'Don\'t have an account? ', num: 25),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Registerview.id);
                      },
                      child: const Texttoview(text: '--> Register', num: 25),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
