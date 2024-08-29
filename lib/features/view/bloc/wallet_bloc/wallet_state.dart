part of 'wallet_bloc.dart';

@immutable
sealed class WalletState {}

final class WalletInitial extends WalletState {}

class LoadingState extends WalletState {}

class ErrorState extends WalletState {}

class SuccesToAddWalletState extends WalletState {}

class GetwalletInfoState extends WalletState {
  final List<GetWalletInfoModel> walletInfo;

  GetwalletInfoState({required this.walletInfo});
}

class SuccessToGetCodes extends WalletState {
  final List<GetCodeModel> code;
  SuccessToGetCodes({
    required this.code,
  });
}

class SuccessToAddMoney extends WalletState {
  final List<AddMoneyToWalletModel> modelForMoney;
  SuccessToAddMoney({
    required this.modelForMoney,
  });
}