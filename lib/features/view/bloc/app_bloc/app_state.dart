// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

class SuccessToGetCategories extends AppState {
  final List<GetBicycleCategoryModel> categories;
  SuccessToGetCategories({
    required this.categories,
  });
}
class SuccessToGetBicycles extends AppState {
  final List<GetBicycleByCategoryModel> bicycles;
  SuccessToGetBicycles({
    required this.bicycles,
  });
}


class LoadingState extends AppState {}

class ErrorState extends AppState {}
