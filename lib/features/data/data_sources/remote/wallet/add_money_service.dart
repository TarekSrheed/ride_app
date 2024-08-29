import 'package:dio/dio.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/features/data/data_sources/remote/core_service.dart';
import 'package:rideshare_app/features/data/model/get_bicycle_category_model.dart';
import 'package:rideshare_app/features/data/model/login_model/handling_model.dart';
import 'package:rideshare_app/features/data/model/wallet/add_money_to_wallet_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rideshare_app/core/config/service_locater.dart';

abstract class AddMoneyService {
  Dio dio = Dio();
  late Response response;
  Future<ResultModel> addMoney(String code);
}

class AddMoneyServiceImp extends AddMoneyService {
  @override
  Future<ResultModel> addMoney(String code) async {
    response = await dio.get(
      '${AppString().BASEURL}/wallet',
      options: Options(
        headers: {
          'Authorization':
              'Bearer ${core.get<SharedPreferences>().getString('token')}'
        },
      ),
      data: {
        'code': code,
      },
    );

    try {
      if (response.statusCode == 200) {
        return ListOf(
          listOfData: List.generate(
            response.data.length,
            (index) => AddMoneyToWalletModel.fromMap(
              response.data[index],
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
