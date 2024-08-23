// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

@immutable
sealed class AppEvent {}

class GetBicycleCategory extends AppEvent {}
class GetBicyclebyCategoryEvent extends AppEvent {
final  String category;
  GetBicyclebyCategoryEvent({
    required this.category,
  });
}




