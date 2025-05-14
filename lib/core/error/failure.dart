import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/error/exception.dart';
import 'package:news_app/core/utils/app_strings.dart';

class Failure {
  static Future<Response> handleError(DioException e) {
    if (e.response != null) {
      debugPrint('Response data: ${e.response!.data}');
      debugPrint('Status code: ${e.response!.statusCode}');
      switch (e.response!.statusCode) {
        case 400:
          throw InvalidCredentialsException(e.response!.data['message']);
        case 401:
          throw InvalidCredentialsException(AppStrings.errorUnauthorized);
        case 403:
          throw ServerException(AppStrings.errorForbidden);
        case 404:
          throw ServerException(AppStrings.errorResource);
        case 429:
          throw ServerException(AppStrings.errorServer);
        case 500:
          throw ServerException(AppStrings.errorInternal);
        default:
          throw ServerException(
            'Server error: ${e.response!.statusCode} ${e.response!.statusMessage}',
          );
      }
    } else {
      debugPrint('Network error: ${e.message}');
      throw NetworkException('============> ${e.toString()}');
      // throw NetworkException(AppStrings.errorNetwork);
    }
  }
}
