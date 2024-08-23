import 'package:dio/dio.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/features/data/data_sources/remote/core_service.dart';
import 'package:rideshare_app/features/data/model/login_model/handling_model.dart';
import 'package:rideshare_app/features/data/model/wallet/add_wallet_model.dart';
import 'package:rideshare_app/features/data/model/wallet/get_wallet_info.dart';

abstract class GetWalletInfoService extends CoreService {
  GetWalletInfoService(super.dio);
  Future<ResultModel> getWalletInfo();
}

class GetWalletInfoServiceImp extends GetWalletInfoService {
  GetWalletInfoServiceImp(super.dio);

  @override
  Future<ResultModel> getWalletInfo() async {
    response = await dio.get('${AppString().BASEURL}/wallet');
    try {
      if (response.statusCode == 200) {
        return ListOf(
          listOfData: List.generate(
            response.data['body'].length,
            (index) => GetWalletInfoModel.fromMap(
              response.data['body'][index],
            ),
          ),
        );
      } else {
        return ErrorModel(message: "There is an Error Please Try Again");
      }
    } on DioException catch (e) {
      return ExceptionModel(message: e.message!);
    }
  }
}
