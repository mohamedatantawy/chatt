import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(Loginloading());
        try {
          UserCredential user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: event.email, password: event.password);
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
    });
    @override
    void onTransition(Transition<LoginEvent, AuthState> transition) {
      // Always call super.onTransition with the current transition
      super.onTransition(transition);
      print(transition);
      // Custom onTransition logic goes here
    }
  }
}
