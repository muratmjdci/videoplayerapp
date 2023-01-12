// ignore_for_file: depend_on_referenced_packages

import 'package:dio/dio.dart';

class RequestInterceptor extends Interceptor {
  RequestInterceptor();

  @override
  void onRequest(options, handler) async {
    options.headers = {'Content-type': 'application/x-www-form-urlencoded'};
    handler.next(options);
  }
}
