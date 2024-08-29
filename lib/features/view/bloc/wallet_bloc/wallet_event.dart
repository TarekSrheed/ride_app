part of 'wallet_bloc.dart';

@immutable
sealed class WalletEvent {}

class AddWalletEvent extends WalletEvent {
  final AddWalletModel model;

  AddWalletEvent({required this.model});
}

class GetCodesEvent extends WalletEvent {}

class GetWalletInfoEvent extends WalletEvent {}

class AddModeyEvent extends WalletEvent {
final  String code;
  AddModeyEvent({required this.code});
}
