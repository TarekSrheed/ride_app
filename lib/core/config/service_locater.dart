
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rideshare_app/features/data/data_sources/remote/auth_service.dart';
import 'package:rideshare_app/features/data/data_sources/remote/get_bicycle_by_category.dart';
import 'package:rideshare_app/features/data/data_sources/remote/get_bicycle_category_service.dart';
import 'package:rideshare_app/features/data/repositories/auth_repository.dart';
import 'package:rideshare_app/features/view/bloc/app_bloc/app_bloc.dart';
import 'package:rideshare_app/features/view/bloc/auth_bloc/auth_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt core = GetIt.instance;
init() async {
  core.registerSingleton(Dio());
  core.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  core.registerSingleton(AuthServiceImp(core.get()));
  // core.registerSingleton(GetBicycleByCategoryImp(core.get()));
  // core.registerSingleton(GetBicycleCategoryServiceImp(core.get()));
  // core.registerSingleton(AppBloc(core.get(), core.get()));
  core.registerSingleton(AuthRepository(core.get()));
  core.registerSingleton(AuthBloc(core.get()));
}
