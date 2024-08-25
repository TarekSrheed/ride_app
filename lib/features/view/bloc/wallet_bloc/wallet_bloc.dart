import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_app/features/data/data_sources/remote/wallet/add_wallet_service.dart';
import 'package:rideshare_app/features/data/data_sources/remote/wallet/get_wallet_info_service.dart';
import 'package:rideshare_app/features/data/model/login_model/handling_model.dart';
import 'package:rideshare_app/features/data/model/wallet/add_wallet_model.dart';
import 'package:rideshare_app/features/data/model/wallet/get_wallet_info.dart';
part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final AddWalletServiceImp addwallet;
  final GetWalletInfoServiceImp getWalletInfo;
  WalletBloc(this.addwallet, this.getWalletInfo) : super(WalletInitial()) {
    List<GetWalletInfoModel> walletInfo = [];
    on<AddWalletEvent>((event, emit) async {
      emit(LoadingState());
      ResultModel result = await addwallet.addWallet(event.model);
      if (result is DataSuccess) {
        emit(SuccesToAddWalletState());
      } else {
        emit(ErrorState());
      }
    });
    on<GetWalletInfoEvent>((event, emit) async {
      emit(LoadingState());
      ResultModel result = await getWalletInfo.getWalletInfo();
      if (result is ListOf<GetWalletInfoModel>) {
        walletInfo = result.listOfData;
        emit(GetwalletInfoState(walletInfo: walletInfo));
      } else {
        emit(ErrorState());
      }
    });
  }
}
