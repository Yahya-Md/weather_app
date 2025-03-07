import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:weather_app/core/constants/api_url_constants.dart';
import 'package:weather_app/core/constants/error_constants.dart';
import 'package:weather_app/core/errors/remote_failure.dart';

abstract class RemoteService {
  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  });
}

const String apiKey =
    String.fromEnvironment('WEATHER_API_KEY', defaultValue: '');
final int codeOK = 200;

class RemoteServiceImpl implements RemoteService {
  final Dio _dio;

  RemoteServiceImpl(this._dio);

  @override
  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      String url = ApiUrlConstants.getApiUrl(path);
      final response = await _dio.get(
        url,
        queryParameters: {...?queryParameters, "appid": apiKey},
      );
      if (response.statusCode == codeOK) {
        return response.data;
      } else {
        throw ServerFailure(ErrorConstants.serverError);
      }
    } catch (e) {
      debugPrint(e.toString());
      throw ServerFailure(ErrorConstants.serverError);
    }
  }
}
