import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ExceptionHandler {
  BuildContext context;

  ExceptionHandler(this.context);

  static Future<(bool, dynamic)> handle(
    dynamic fun, {
    Function()? onErrorReturn,
    bool showToastOnSuccess = false,
    String? errorTitle,
  }) async {
    try {
      var data = await fun;

      // Show Success Toast HERE

      return (true, data);
    } on DioException {
      // SHOW DIO ERROR DIALOG HERE
    } catch (e) {
      // SHOW GENERAL ERROR DIALOG HERE
    }

    if (onErrorReturn != null) return onErrorReturn();

    return (false, null);
  }
}
