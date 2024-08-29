import 'package:dio/dio.dart';
import 'model/hups_model.dart';

final Dio dio = Dio();

Future<List<HupsModel>> fetchHupsModel({
  required double latitude,
  required double longitude,
}) async {
  try {
    final response = await dio.get(
      'https://rideshare.devscape.online/api/v1/hubs?longtitude=36.2944601&latitude=33.5089789',
      options: Options(
        headers: {
          'Authorization':
              ' Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIwOTg4OTczNDAzIiwiaWF0IjoxNzI0NTcyMjEzLCJleHAiOjE3MjQ2NTg2MTN9.-QfTVFb-E7P1qXxiPsGftmrvRyBt3KX1MeUAQYlHZjk',
        },
      ),
    );

    print('Request URL: ${response.requestOptions.uri}');
    print('Request Headers: ${response.requestOptions.headers}');
    print('Response status: ${response.statusCode}');
    print('Response data: ${response.data}');

    if (response.statusCode == 200) {
      List<HupsModel> hups = List.generate(
        response.data['body'].length,
        (index) => HupsModel.fromMap(response.data['body'][index]),
      );
      return hups;
    } else {
      throw Exception(
          'Failed to fetch Hups data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error fetching Hups data: $e');
    throw Exception('Error fetching Hups data: $e');
  }
}
