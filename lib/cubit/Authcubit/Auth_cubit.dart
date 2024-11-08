import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'Auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(LoginInitial());

  Future<void> Loginpage(
      {required String email, required String password}) async {
    emit(Loginloading());
    await Future.delayed(Duration(seconds: 8));
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(Loginsuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        emit(Loginfailure(errormassage: 'user-not found'));
      } else if (ex.code == 'wrong-password') {
        emit(Loginfailure(errormassage: 'wrong-password'));
      }
    } catch (e) {
      emit(Loginfailure(errormassage: 'there are error'));
    }
  }

  Future<void> registerpage(
      {required String email, required String password}) async {
    try {
      emit(Registerloading());
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      emit(Registersuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(Registerfailure(errormassage: 'weak-password'));
      } else if (e.code == 'email-already-in-use') {
        emit(Registerfailure(errormassage: 'email-already-in-use'));
      }
    } catch (e) {
      emit(Registerfailure(errormassage: 'there are erorr'));
    }
  }
}
