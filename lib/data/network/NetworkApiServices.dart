import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:task_managment_app/data/network/BaseApiSevices.dart';

import '../app_exceptions.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future getApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url),headers: {"X-API-KEY":"taibah123456"}).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @override
  Future postApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await http
          .post(Uri.parse(url), body: data,headers: {"X-API-KEY":"taibah123456"})
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      default:
        throw FetchDataException(
            "Error Accured while communicating with server with status code ${response.statusCode}");
    }
  }
}
