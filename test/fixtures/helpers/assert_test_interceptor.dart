import 'package:dio/dio.dart';

class AssertTestInterceptor extends Interceptor {
  AssertTestInterceptor({this.assertRequest, this.assertResponse, this.assetError});

  final Function(RequestOptions options, RequestInterceptorHandler handler)? assertRequest;
  final Function(Response response, ResponseInterceptorHandler handler)? assertResponse;
  final Function(DioError err, ErrorInterceptorHandler handler)? assetError;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (assertRequest != null) {
      assertRequest!(options, handler);
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (assertResponse != null) {
      assertResponse!(response, handler);
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (assetError != null) {
      assetError!(err, handler);
    }
    return super.onError(err, handler);
  }
}
