part of 'wallet_bloc.dart';

@immutable
sealed class WalletEvent {}

class AddWalletEvent extends WalletEvent {
  final AddWalletModel model;

  AddWalletEvent({required this.model});
}


class GetWalletInfoEvent extends WalletEvent{}
