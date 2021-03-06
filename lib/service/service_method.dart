import "package:dio/dio.dart";
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

Future post(String url, Map formData) async {
  try {
    Response response;
    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    response = await dio.post(url, data: formData);
    if (response.statusCode == 200) {
      print("pppppp$response");
      return response;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
  } catch (e) {
    return print('ERROR:======>$e');
  }
}

Future get(String url, Map formData) async {
  try {
    Response response;
    response = await Dio().get(url, queryParameters: formData);
    return response.data;
  } catch (e) {
    return print(e);
  }
}

Future getHomePageContent() {
  var formData = {'page': '1'};
  return post(servicePath['homePageContext'], formData);
}
