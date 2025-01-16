import 'package:dio/dio.dart';

class ApiService {
  static Dio dio = Dio();
  Future<Response> fetchData() async {
    return await dio.get('https://dummyjson.com/c/cef4-0b51-43f1-92e9');
  }
}
