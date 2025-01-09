import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  ApiService() {
    _dio.options.baseUrl = 'http://54.170.183.211/api/v1/';
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
  }

  Future<Map<String, dynamic>> getMealCategories({required String langId}) async {
    try {
      final response = await _dio.post(
        'get-mealcategories',
        data: {
          'lang_id': langId,
        },
      );

      if (response.statusCode == 200) {
        print(response.data.toString());
        return response.data;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Error occurred: $error');
    }
  }
}
