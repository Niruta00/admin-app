import 'package:admin_app/data/network/base_api_service.dart';
import 'package:admin_app/data/response/api_response.dart';
import 'package:admin_app/model/user_model.dart';
import 'package:admin_app/repository/auth_repo.dart';
import 'package:admin_app/utils/routes/routes_name.dart';
import 'package:admin_app/utils/routes/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthViewModel extends ChangeNotifier {
  final _authRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
    print(loading);
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
    print(signUpLoading);
  }

  Future<void> logInApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _authRepo.loginApi(data).then((value) {
      setLoading(false);
      RegisterUserModel userModel = RegisterUserModel(token: value['token']);
      
      Utils.flushBarErrorMessage('login sucessfully', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      // setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      // if (kDebugMode) {
      print(error.toString());
      setLoading(false);
      // }
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    _authRepo.SignUpApi(data, context).then((value) {
      Utils.flushBarErrorMessage('login sucessfully', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
