import 'package:develp/Views/widget/Loginviewbody.dart';
import 'package:develp/bloc/auth_bloc.dart';
import 'package:develp/constant.dart';
import 'package:develp/cubit/Authcubit/Auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = 'login id';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        backgroundColor: kprimaycolor,
        body: Loginviewbody(),
      ),
    );
  }
}
