import 'package:dio/dio.dart';

class Dio_Helper{

  static late Dio dio;

  static init(){
    dio = Dio(
      BaseOptions(baseUrl: 'https://api.openweathermap.org/',receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> GetData({required String url})
  async{
    return await dio.get(url);
  }

}