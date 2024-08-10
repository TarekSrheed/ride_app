part of 'app_manager_bloc.dart';

@immutable
sealed class AppManagerEvent {}

class Success extends AppManagerEvent {}

class Failed extends AppManagerEvent {}

class CheckAuthorized extends AppManagerEvent {}

class LogOut extends AppManagerEvent {}