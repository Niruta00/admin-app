
import 'package:admin_app/data/network/base_api_service.dart';
import 'package:admin_app/data/network/network_api_service.dart';
import 'package:admin_app/model/user_model.dart';
import 'package:admin_app/res/app_url.dart';

class HomeRepository {
  BaseApiServices _apiServices = NetworkApiServices();
  Future<RegisterUserModel>requestApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.baseUrl);
      return response = RegisterUserModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
