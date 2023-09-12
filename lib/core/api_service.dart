import 'package:dio/dio.dart';

class ApiService {
  final String _baseURL = 'https://www.googleapis.com/books/v1/';
  Dio dio;
  ApiService({required this.dio});

  Future<Map<String, dynamic>> getData({required String endPoint}) async {
    var response = await dio.get('$_baseURL$endPoint');
    return response.data;
  }
}
