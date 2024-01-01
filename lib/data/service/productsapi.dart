import 'package:dio/dio.dart';

class productsapi {
  final Dio dio;
  final String baseurl = "https://fakestoreapi.com/";
  productsapi(this.dio);

  Future<List<dynamic>> getapi({required String endpoint}) async {
    var response = await dio.get("$baseurl$endpoint");
    return response.data;
  }
}
