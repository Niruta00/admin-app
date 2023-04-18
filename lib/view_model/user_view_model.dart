// import 'package:admin_app/model/user_model.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// class UserViewModel extends ChangeNotifier {
//   Future<bool> saveUser(RegisterUserModel RegisterUserModel) async {
//     final SharedPreferences sp = await SharedPreferences.getInstance();
//     sp.setString('token', UserViewModel.token.toString());
//     notifyListeners();

//     return true;
//   }

//   Future<RegisterUserModel> getUser() async {
//     final SharedPreferences sp = await SharedPreferences.getInstance();
//     final String? token = sp.getString('token');
//     final RegisterUserModel user = RegisterUserModel(token: token);
//     notifyListeners();

//     return user;
//   }

//   Future<bool> remove() async {
//     final SharedPreferences sp = await SharedPreferences.getInstance();
//     sp.remove('token');
//     notifyListeners();
//     return true;
//   }
// }