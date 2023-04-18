import 'package:admin_app/data/response/status.dart';
import 'package:flutter/material.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse(this.data, this.message, this.status);
  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.error(this.message) : status = Status.ERROR;

  String toString() {
    return "Status:$status\n  message:$message\n Data:$data";
  }
}
