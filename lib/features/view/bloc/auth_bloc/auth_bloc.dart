// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_app/core/handling_error/auth_handling.dart';
import 'package:rideshare_app/features/data/model/login_user_model.dart';
import 'package:rideshare_app/features/data/model/user_model.dart';
import 'package:rideshare_app/features/data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repository;

  AuthBloc(this.repository) : super(AuthInitial()) {
    on<SignUp>((event, emit) async {
      emit(Loading());
      //var
      var data = await repository.signUp(event.user);
      if (data is DataSuccess) {
        emit(SuccessToLogIn());
      } else {
        emit(FailedToLogIn(message: (data as DataFailed).message));
      }
    });
    on<Login>((event, emit) async {
      var data = await repository.login(event.user);
      if (data is DataSuccess) {
        emit(SuccessToLogIn());
      } else {
        emit(FailedToLogIn(message: (data as DataFailed).message));
      }
    });
  }
}
