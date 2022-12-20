import 'package:dio/dio.dart';

class MarketApi {
  static Dio dio = Dio();

  static void configureDio() {
    dio.options.baseUrl = "https://api.plos.org/";

    dio.options.connectTimeout = 15000;
    dio.options.contentType = "application/json;charset=UTF-8";
    dio.options.receiveTimeout = 15000;
  }

//----METHOD GET----------------------------

  static Future httpGet({required String path}) async {
    Map<String, dynamic> _map = <String, dynamic>{};
    Response response;

    try {
      response = await dio.get(path);

      if (response.statusCode == 200) {
        _map["code"] = response.statusCode;
        _map["data"] = response.data["response"]["docs"];
        return _map;
      }
    } on DioError catch (e) {
      _map["code"] = 0;
      _map["data"] = "Conexion fallida $e";
    }
  }
}
