import 'package:develp/Views/LoginView.dart';
import 'package:develp/Views/RegisterView.dart';
import 'package:develp/Views/chatView.dart';
import 'package:develp/cubit/chatcubit/chat_cubit.dart';
import 'package:develp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const chat_App());
}

class chat_App extends StatelessWidget {
  const chat_App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: MaterialApp(
        routes: {
          LoginView.id: (context) => const LoginView(),
          Registerview.id: (context) => const Registerview(),
          Chatview.id: (context) =>  Chatview(),
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Shadows Into Light',
        ),
        initialRoute: LoginView.id,
      ),
    );
  }
}
