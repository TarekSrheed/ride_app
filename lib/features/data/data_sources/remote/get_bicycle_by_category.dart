import 'package:dio/dio.dart';
import 'package:rideshare_app/core/res/app_string.dart';
import 'package:rideshare_app/features/data/data_sources/remote/core_service.dart';
import 'package:rideshare_app/features/data/model/get_bicycle_by_category.dart';
import 'package:rideshare_app/features/data/model/login_model/handling_model.dart';

abstract class GetBicycleByCategory extends CoreService {
  GetBicycleByCategory(super.dio);

  Future<ResultModel> getBicycleByCategory(String category);
}

class GetBicycleByCategoryImp extends GetBicycleByCategory {
  GetBicycleByCategoryImp(super.dio);

  @override
  Future<ResultModel> getBicycleByCategory(String category) async {
    response = await dio.get(
        '${AppString().BASEURL}bicycle/bicycles-by-category?category=$category');
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
