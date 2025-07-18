import 'dart:developer';

import 'package:cosmo_futsal/core/common/error_model/error_model.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestLoginService {
  final Dio dio;

  TestLoginService(this.dio);

  Future<Either<dynamic, ErrorModel>> userLogin({
    required Map<String, dynamic> formData,
  }) async {
    try {
      final response = await dio.post(
        'https://dummyjson.com/auth/login',
        data: formData,
      );

      log("Login response: ${response.data.toString()}");

      if (response.statusCode == 200 && response.data != null) {
        final token = response.data["accessToken"];

        if (token == null) {
          return right(ErrorModel(
            code: 500,
            message: 'Token missing in response.',
          ));
        }

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("accessToken", token);
        await prefs.setString("userEmail", formData["username"]);
        await prefs.setString("userPassword", formData["password"]);

        return left(response.data);
      } else {
        return right(ErrorModel(
          code: response.statusCode,
          message: 'Login failed: ${response.statusMessage}',
        ));
      }
    } catch (e) {
      return right(ErrorModel(
        code: 500,
        message: 'Error occurred: $e',
      ));
    }
  }
}

