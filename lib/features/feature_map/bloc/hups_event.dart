part of 'hups_bloc.dart';

@immutable
sealed class HupsEvent {}

class GetHups extends HupsEvent {
  final double longitude;
  final double latitude;
  GetHups({
    required this.longitude,
    required this.latitude,
  });
}
