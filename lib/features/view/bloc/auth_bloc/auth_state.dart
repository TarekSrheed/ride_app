part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class SuccessToLogIn extends AuthState {}

class FailedToLogIn extends AuthState {
  final String message;
  FailedToLogIn({
    required this.message,
  });
}

class Loading extends AuthState {}
