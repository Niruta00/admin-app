import 'package:admin_app/data/response/api_response.dart';
import 'package:admin_app/model/user_model.dart';
import 'package:admin_app/repository/home_repo.dart';
import 'package:flutter/widgets.dart';

class HomeViewModel with ChangeNotifier {

  final _myrepo = HomeRepository();
  ApiResponse<RegisterUserModel> userList = ApiResponse.loading();
  SetUserList(ApiResponse<RegisterUserModel> response) {
    userList = response;
    // notifyListeners();
  }

  Future<void> requestApi() async {
    SetUserList(ApiResponse.loading());
    _myrepo.requestApi().then((value) {
       SetUserList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      SetUserList(ApiResponse.error(error.toString()));
    });
  }
}
