part of 'hups_bloc.dart';

@immutable
sealed class HupsState {}

final class HupsInitial extends HupsState {}

class SuccessToGetHups extends HupsState {
  final List<HupsModel> hups;
  SuccessToGetHups({
    required this.hups,
  });
}

class ErrorState extends HupsState {
  final String errorMessage;
  ErrorState({
    required this.errorMessage,
  });
}

class LoadingState extends HupsState {}
