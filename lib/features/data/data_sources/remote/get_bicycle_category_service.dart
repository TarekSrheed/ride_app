import 'package:dio/dio.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/features/data/data_sources/remote/core_service.dart';
import 'package:rideshare_app/features/data/model/get_bicycle_category_model.dart';
import 'package:rideshare_app/features/data/model/login_model/handling_model.dart';

abstract class GetBicycleCategoryService {
  Dio dio = Dio();
  late Response response;
  Future<ResultModel> getBicycleCategory();
}

class GetBicycleCategoryServiceImp extends GetBicycleCategoryService {
  @override
  Future<ResultModel> getBicycleCategory() async {
    response = await dio.get(
      '${AppString().BASEURL}/bicycle/bicycles-categories',
      options: Options(
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwOTgxMTAzMjA4IiwiaWF0IjoxNzI0NTg0MjYxLCJleHAiOjE3MjQ2NzA2NjF9.Z_qvt2BIiNHq_TFMjx6uFGnUHHxapW1t_daNZ6wX_ws'
        },
      ),
    );

    try {
      if (response.statusCode == 200) {
        return ListOf(
          listOfData: List.generate(
            response.data['body'].length,
            (index) => GetBicycleCategoryModel(
              body: response.data['body'],
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
