import 'package:dio/dio.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/features/data/data_sources/remote/core_service.dart';
import 'package:rideshare_app/features/data/model/login_model/handling_model.dart';
import 'package:rideshare_app/features/data/model/wallet/add_wallet_model.dart';
import 'package:rideshare_app/features/data/model/wallet/get_wallet_info.dart';

abstract class AddWalletService extends CoreService {
  AddWalletService(super.dio);
  Future<ResultModel> addWallet(AddWalletModel model);
}

class AddWalletServiceImp extends AddWalletService {
  AddWalletServiceImp(super.dio);

  @override
  Future<ResultModel> addWallet(AddWalletModel model) async {
    response = await dio.post(
      '${AppString().BASEURL}/wallet',
      data: model.toMap(),
    );
    try {
        if (response.statusCode == 200) {
       return DataSuccess();
    } else {
        return ErrorModel(message: "There is an Error Please Try Again");
      }
    } on DioException catch (e) {
      return ExceptionModel(message: e.message!);
    }
  
  }
}
