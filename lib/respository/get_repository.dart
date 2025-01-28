import 'package:task_managment_app/data/network/BaseApiSevices.dart';
import 'package:task_managment_app/data/network/NetworkApiServices.dart';

class GetRepository{
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<dynamic> getApi(String url) async {
    try {
      dynamic response =
          await _apiServices.getApiResponse(url);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> postApi(String url, data) async {
    try {
      dynamic response =
          await _apiServices.postApiResponse(url, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}