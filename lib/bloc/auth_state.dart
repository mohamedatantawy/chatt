part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}


final class Loginloading extends AuthState {}

final class Loginsuccess extends AuthState {}

final class Loginfailure extends AuthState {
  final String errormassage;

  Loginfailure({required this.errormassage});
}


final class Registerloading extends AuthState {}

final class Registersuccess extends AuthState {}

final class Registerfailure extends AuthState{
  final String errormassage;

  Registerfailure({required this.errormassage});
}
