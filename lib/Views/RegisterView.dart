import 'package:develp/Views/widget/RegisterBody.dart';
import 'package:develp/cubit/Authcubit/Auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Registerview extends StatelessWidget {
  const Registerview({super.key});
  static String id = 'Register id';
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) =>AuthCubit(),
      child: Scaffold(
        body: Registerbody(),
      ),
    );
  }
}
