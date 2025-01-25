// ignore_for_file: avoid_annotating_with_dynamic

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

const int _defaultConnectTimeout = 10000;
const int _defaultReceiveTimeout = 10000;

class DioClient with AppLogger {
  DioClient(
    this.baseUrl,
    Dio? dio, {
    this.interceptors,
  }) {
    _dio = dio ?? Dio();
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = const Duration(
        milliseconds: _defaultConnectTimeout,
      )
      ..options.receiveTimeout = const Duration(
        milliseconds: _defaultReceiveTimeout,
      )
      ..httpClientAdapter
      ..options.headers = {'Content-Type': 'application/json; charset=UTF-8'};
    if (interceptors?.isNotEmpty ?? false) {
      _dio.interceptors.addAll(interceptors!);
    }
    if (kDebugMode) {
      _dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          requestHeader: false,
          responseHeader: false,
        ),
      );
    }
  }

  final String baseUrl;
  late Dio _dio;
  String? accessToken;

  // final String _appBuildNumber =
  //     getItInstance<GPInfoService>().packageInfo?.buildNumber ?? '1';

  final List<Interceptor>? interceptors;

  void updateAccessToken({String? token}) {
    if (token == null) {
      return;
    }
    accessToken = token;
    _dio.options.headers.addAll({'authorization': 'Doctor $accessToken'});
    log.info('accessToken: $accessToken');
  }

  void clearToken() {
    accessToken = null;
    _dio.options.headers.remove('authorization');
    log.info('accessToken cleared');
  }

  Future<dynamic> get(
    String uri, {
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    updateAccessToken();
    try {
      final response = await _dio.getUri(
        Uri.parse(uri),
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode != null && response.statusCode! <= 204) {
        return response.data;
      } else {
        throw NetworkException(
          message: response.data['message'],
          code: response.data['statusCode'],
        );
      }
    } on SocketException catch (e) {
      throw NetworkException(
        message: e.toString(),
        code: 'SOCKET_EXCEPTION',
      );
    } on FormatException catch (_) {
      throw NetworkException(
        message: 'Unable to process the data',
        code: 'FORMAT_EXCEPTION',
      );
    } on DioException catch (e) {
      throw NetworkException.fromStatusCode(e.response?.statusCode ?? 500);
    }
  }

  Future<dynamic> post(
    String uri, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    updateAccessToken();
    try {
      final response = await _dio.postUri(
        Uri.parse(uri),
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode != null && response.statusCode! <= 204) {
        return response.data;
      } else {
        throw Exception(response.data.message);
      }
    } on SocketException catch (e) {
      log.severe('socket exception');
      throw NetworkException(
        message: e.toString(),
        statusCode: 420,
        code: 'SOCKET_EXCEPTION',
      );
    } on FormatException catch (_) {
      log.severe('format exception');
      throw NetworkException(
        message: 'Unable to process the data',
        statusCode: 430,
        code: 'FORMAT_EXCEPTION',
      );
    } on DioException catch (e) {
      log.severe('dio exception');
      throw NetworkException.fromStatusCode(e.response?.statusCode ?? 500);
    }
  }

  Future<dynamic> put(
    String uri, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    updateAccessToken();
    try {
      final response = await _dio.putUri(
        Uri.parse(uri),
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode != null && response.statusCode! <= 204) {
        return response.data;
      } else {
        throw Exception(response.data.message);
      }
    } on SocketException catch (e) {
      throw NetworkException(
        message: e.toString(),
        statusCode: 420,
        code: 'SOCKET_EXCEPTION',
      );
    } on FormatException catch (_) {
      throw NetworkException(
        message: 'Unable to process the data',
        statusCode: 430,
        code: 'FORMAT_EXCEPTION',
      );
    } on DioException catch (e) {
      throw NetworkException.fromStatusCode(e.response?.statusCode ?? 500);
    }
  }

  Future<dynamic> deleteUri(
    String uri, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    updateAccessToken();
    try {
      final response = await _dio.deleteUri(
        Uri.parse(uri),
        data: data,
        options: options,
        cancelToken: cancelToken,
      );

      if (response.statusCode != null && response.statusCode! <= 204) {
        return response.data;
      } else {
        throw Exception(response.data.message);
      }
    } on SocketException catch (e) {
      throw NetworkException(
        message: e.toString(),
        statusCode: 420,
        code: 'SOCKET_EXCEPTION',
      );
    } on FormatException catch (_) {
      throw NetworkException(
        message: 'Unable to process the data',
        statusCode: 430,
        code: 'FORMAT_EXCEPTION',
      );
    } on DioException catch (e) {
      throw NetworkException.fromStatusCode(e.response?.statusCode ?? 500);
    }
  }

  void resetAuthorizationHeader() {
    _dio.options.headers.remove('authorization');
    accessToken = null;
  }
}
