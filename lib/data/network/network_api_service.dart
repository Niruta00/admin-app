import 'dart:convert';
// import 'dart:html';
import 'dart:io';

import 'package:admin_app/app_exception.dart';
import 'package:admin_app/data/network/base_api_service.dart';
import 'package:admin_app/data/response/api_response.dart';
import 'package:admin_app/res/app_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkApiServices extends BaseApiServices {
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(AppUrl.getUserUrl))
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("no internet");
    }
    return responseJson;
  }

  dynamic responseJson;

  Future getPostApiResponse(String Url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await post(
        Uri.parse(AppUrl.getUserUrl),
         body: data
         ).timeout(Duration(seconds: 20));
      responseJson = returnResponse(response);
     
    } on SocketException {
      throw FetchDataException('No Internet ');
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
    case 500:
    case 404:
      throw UnauthorizedException(response.body.toString()+response.statusCode.toString());
    default:
      throw FetchDataException(
          'Error Occur' + 'with status code' + response.statusCode.toString());
  }

}


}
