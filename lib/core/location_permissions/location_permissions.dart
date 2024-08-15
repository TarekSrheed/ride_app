import 'package:geolocator/geolocator.dart';

Future<Position> determinPosition() async {
  bool serviceEnbled;
  LocationPermission permission;
  serviceEnbled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnbled) {
    return Future.error('location service are disabled');
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Locaion permission denied');
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return Future.error('Location premisson are premanently denied');
  }
  Position position = await Geolocator.getCurrentPosition();
  return position;
}
