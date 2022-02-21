import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // options.headers["Authorization"] = "Basic ZHhtaF93ZWI6ZHhtaF93ZWJfc2VjcmV0";
    // options.headers["token"] = "Bearer ";
    // options.headers["response-status"] = 401;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(dio.Response response, ResponseInterceptorHandler handler) {
   // String? Authorization = Authorization?.getString('AuthorizationToken');
    super.onResponse(response, handler);
  }
  // @override
  // void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
  //   ///token from cache
  //   var token = Cache.getToken();
  //   options.headers["Authorization"] = "Basic $token";
  //   super.onRequest(options, handler);
  // }
  //
  // @override
  // void onResponse(dio.Response response, ResponseInterceptorHandler handler) {
  //   super.onResponse(response, handler);
  // }
}
