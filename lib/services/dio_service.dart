// ignore_for_file: non_constant_identifier_names, depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import '../app/constants.dart';
import '../app/interceptors/request_interceptor.dart';

abstract class NetworkManager {
  Future<Response> get(String path);
  Future<Response> post(String path, {Map<String, dynamic>? data});
  Future<Response> put(String path, {Map<String, dynamic>? data});
  Future<Response> patch(String path, {Map<String, dynamic>? data});
}

class NetworkManagerImpl implements NetworkManager {
  final int cacheHold = 1;

  Dio get dio => _dio;
  NetworkManager() {
    _dio.interceptors.addAll([
      RequestInterceptor(),
      DioCacheInterceptor(
        options: CacheOptions(
          store: MemCacheStore(),
          allowPostMethod: true,
          policy: CachePolicy.forceCache,
          maxStale:  Duration(days: cacheHold),
          priority: CachePriority.normal,
        ),
      )
    ]);
  }

  static const _baseUrl = C.baseurl;

  final _dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: 12000,
      sendTimeout: 12000,
    ),
  );

  @override
  Future<Response> get(String path) async {
    try {
      return await _dio.get(path);
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<Response> post(String path, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.post(path, data: data);
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<Response> put(String path, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.put(path, data: data);
    } on DioError {
      rethrow;
    }
  }

  @override
  Future<Response> patch(String path, {Map<String, dynamic>? data}) async {
    try {
      return await _dio.patch(path, data: data);
    } on DioError {
      rethrow;
    }
  }
}
