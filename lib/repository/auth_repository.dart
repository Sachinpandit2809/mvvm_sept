import 'package:mvvm_sept/data/network/baseApiServices.dart';
import 'package:mvvm_sept/data/network/networkApiServices.dart';
import 'package:mvvm_sept/resource/api/app_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiServices(AppUrl.login, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> signupApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiServices(AppUrl.signup, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
