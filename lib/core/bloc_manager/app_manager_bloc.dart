// ignore_for_file: depend_on_referenced_packages

<<<<<<< HEAD
import 'package:bloc/bloc.dart';
=======
import 'package:flutter_bloc/flutter_bloc.dart';
>>>>>>> 754d5ae7bccc02137f2eb8df2fa5bc6f5d950513
import 'package:meta/meta.dart';
import 'package:rideshare_app/core/config/service_locater.dart';

import 'package:shared_preferences/shared_preferences.dart';
part 'app_manager_event.dart';
part 'app_manager_state.dart';

class AppManagerBloc extends Bloc<AppManagerEvent, AppManagerState> {
  AppManagerBloc() : super(AppManagerInitial()) {
    on<CheckAuthorized>(
      (event, emit) {
        if (core.get<SharedPreferences>().getString('token') == null ||
            core.get<SharedPreferences>().getString('token') == '') {
          emit(NavigateToLogin());
        } else {
          emit(NavigateToMainPage());
        }
      },
    );
    on<Success>((event, emit) {
      emit(NavigateToMainPage());
    });
    on<Failed>((event, emit) {
      emit(NavigateToLogin());
    });
    on<LogOut>((event, emit) {
      core.get<SharedPreferences>().setString('token', '');
      emit(NavigateToLogin());
    });
  }
}
