part of 'Auth_cubit.dart';

@immutable
sealed class AuthState {}

final class LoginInitial extends AuthState {}

final class Loginloading extends AuthState {}

final class Loginsuccess extends AuthState {}

final class Loginfailure extends AuthState {
  final String errormassage;

  Loginfailure({required this.errormassage});
}

final class RegisterInitial extends AuthState {}

final class Registerloading extends AuthState {}

final class Registersuccess extends AuthState {}

final class Registerfailure extends AuthState{
  final String errormassage;

  Registerfailure({required this.errormassage});
}
