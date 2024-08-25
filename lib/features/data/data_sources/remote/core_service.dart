import 'package:dio/dio.dart';

abstract class CoreService {
  final Dio dio ;
  late Response response;

  CoreService(this.dio);
}

