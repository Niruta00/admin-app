import 'dart:convert';

import 'package:admin_app/data/network/base_api_service.dart';
import 'package:admin_app/data/network/network_api_service.dart';
import 'package:admin_app/res/app_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AuthRepository {
  BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.getUserUrl, data);

      return response;
    } catch (e) {
      throw e;
    }
    // try {
    //   final response = await post(Uri.parse(AppUrl.getUserUrl), body: data)
    //       .timeout(const Duration(seconds: 10));
    //   var data = jsonDecode(response.body);
    //   if (response.statusCode == 200) {
    //     return data;
    //   } else if (response.statusCode == 400) {
    //     return data;
    //   }
    // } catch (e) {
    //   throw e;
    // }
  }

  Future<dynamic> SignUpApi(dynamic data, BuildContext context) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.getRegisterUrl, data);

      return response;
    } catch (e) {
      throw e;
    }
  }
}
