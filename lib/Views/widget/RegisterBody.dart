import 'package:develp/Views/widget/list_title.dart';
import 'package:develp/Views/widget/textFormfield.dart';
import 'package:develp/Views/widget/texttoView.dart';
import 'package:develp/constant.dart';
import 'package:develp/cubit/Authcubit/Auth_cubit.dart';
import 'package:develp/helper/showSnackerbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Registerbody extends StatelessWidget {
  String? email, password;
  bool isloading = false;
  GlobalKey<FormState> formkey = GlobalKey();

  Registerbody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit , AuthState>(
      listener: (context, state) {
        if (state is Registerloading) {
          isloading = true;
        } else if (state is Registersuccess) {
          isloading = false;
          Navigator.pop(context);
        } else if (state is Registerfailure) {
          isloading = false;
          showsnackbar(context, state.errormassage);
           Navigator.pop(context);

        }
      },
      builder:(context,snapshot)=> ModalProgressHUD(
        inAsyncCall: isloading,
        child: Container(
          color: kprimaycolor,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Form(
            key: formkey,
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
                const Texttoview(text: 'Register', num: 40),
                const SizedBox(
                  height: 40,
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
                    onsave: (value) {
                      password = value;
                    },
                    hint: 'password'),
                const SizedBox(
                  height: 30,
                ),
                Listtile(
                  text: 'Register',
                  ontap: () async {
                    if (formkey.currentState!.validate()) {
                      BlocProvider.of<AuthCubit>(context)
                          .registerpage(email: email!, password: password!);
                    }
                  },
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Texttoview(text: 'Don\'t have an account? ', num: 25),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Texttoview(text: '--> Login', num: 25),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
