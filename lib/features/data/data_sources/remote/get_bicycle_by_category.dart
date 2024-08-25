import 'package:dio/dio.dart';
import 'package:rideshare_app/core/config/service_locater.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/features/data/data_sources/remote/core_service.dart';
import 'package:rideshare_app/features/data/model/get_bicycle_by_category.dart';
import 'package:rideshare_app/features/data/model/login_model/handling_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GetBicycleByCategory {
  Dio dio = Dio();
  late Response response;

  Future<ResultModel> getBicycleByCategory(String category);
}

class GetBicycleByCategoryImp extends GetBicycleByCategory {
  @override
  Future<ResultModel> getBicycleByCategory(String category) async {
    response = await dio.get(
      '${AppString().BASEURL}/bicycle/bicycles-by-category?category=$category',
      options: Options(
        headers: {
          'Authorization':
              'Bearer ${core.get<SharedPreferences>().getString('token')}'
        },
      ),
    );

    try {
      if (response.statusCode == 200) {
        return ListOf(
          listOfData: List.generate(
            response.data['body'].length,
            (index) => GetBicycleByCategoryModel.fromMap(
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
