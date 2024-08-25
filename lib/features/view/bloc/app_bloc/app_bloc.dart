// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rideshare_app/features/data/data_sources/remote/get_bicycle_by_category.dart';
import 'package:rideshare_app/features/data/data_sources/remote/get_bicycle_category_service.dart';
import 'package:rideshare_app/features/data/model/get_bicycle_by_category.dart';
import 'package:rideshare_app/features/data/model/get_bicycle_category_model.dart';
import 'package:rideshare_app/features/data/model/login_model/handling_model.dart';
part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    List<GetBicycleCategoryModel> categories = [];
    List<GetBicycleByCategoryModel> bicycles = [];
    on<GetBicycleCategory>((event, emit) async {
      emit(LoadingState());

      ResultModel result =
          await GetBicycleCategoryServiceImp().getBicycleCategory();
      if (result is ListOf<GetBicycleCategoryModel>) {
        categories = result.listOfData;
        emit(SuccessToGetCategories(categories: categories));
      } else {
        emit(ErrorState());
      }
    });

    on<GetBicyclebyCategoryEvent>((event, emit) async {
      emit(LoadingState());

      ResultModel result =
          await GetBicycleByCategoryImp().getBicycleByCategory(event.category);
      if (result is ListOf<GetBicycleByCategoryModel>) {
        bicycles = result.listOfData;
        emit(SuccessToGetBicycles(bicycles: bicycles));
      } else {
        emit(ErrorState());
      }
    });
  }
}
