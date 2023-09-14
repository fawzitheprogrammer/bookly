import 'package:dio/dio.dart';

class ApiService {
  final String _baseURL = 'https://www.googleapis.com/books/v1/';
  final Dio _dio;
  ApiService({required Dio dio}) : _dio = dio;

  Future<Map<String, dynamic>> getData({required String endPoint}) async {
    var response = await _dio.get('$_baseURL$endPoint');
    return response.data;
  }
}
