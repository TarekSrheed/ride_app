part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignUp extends AuthEvent {
  final UserModel user;

  SignUp({required this.user});

}

class Login extends AuthEvent {
  final LoginUserModel user;

  Login({required this.user});

}