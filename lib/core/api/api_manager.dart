import 'package:dio/dio.dart';
import 'package:news_app/core/api/api_endpoint.dart';
import 'package:news_app/core/error/exception.dart';
import 'package:news_app/core/error/failure.dart';

class ApiManager {
  static final ApiManager _instance = ApiManager._internal();

  factory ApiManager() {
    return _instance;
  }

  static Dio? _dio;

  ApiManager._internal() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: ApiEndPoint.baseUrl,
      contentType: "application/json",
      receiveDataWhenStatusError: true,
    );
    _dio = Dio(baseOptions);
    _dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers["Content-Type"] = "application/json";
          return handler.next(options);
        },
      ),
    );
  }

  static Future<Response> getData({
    required String endpoint,
    Map<String, dynamic>? query,
  }) async {
    try {
      Response response = await _dio!.get(endpoint, queryParameters: query);
      return response;
    } catch (e) {
      if (e is DioException) {
        throw Failure.handleError(e);
      } else {
        throw ServerException('Ephraim error ${e.toString()}');
      }
    }
  }

  static Future<Response> postData({
    required String endpoint,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
  }) async {
    try {
      Response response = await _dio!.post(
        endpoint,
        data: data,
        queryParameters: query,
      );
      return response;
    } catch (e) {
      if (e is DioException) {
        throw Failure.handleError(e);
      } else {
        throw ServerException('unhandled error ${e.toString()}');
      }
    }
  }
}
