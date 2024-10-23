import 'package:{{name.snakeCase()}}/core/constant/api_constant.dart';
import 'package:{{name.snakeCase()}}/core/util/logger_util.dart';
import 'package:{{name.snakeCase()}}/core/util/map_util.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class ApiLogInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final url = options.uri.toString();
    final method = options.method;
    final header = options.headers;
    final body = options.queryParameters;

    LoggerUtil.instance().logApi(
      level: Level.info,
      type: ApiType.request,
      url: url,
      method: method,
      header: header,
      body: convertDynamicMap(body),
    );

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final url = response.requestOptions.uri.toString();
    final method = response.requestOptions.method.toUpperCase();
    final code = response.statusCode ?? -1;

    /// Alter incoming response from API to match our Response schema
    Map<String, dynamic> data;

    if (response.data is Map<String, dynamic>) {
      data = response.data;
    } else {
      data = {
        'data': response.data,
      };
    }

    data['status_code'] = response.statusCode;
    data['message'] = response.statusMessage;

    response.data = data;

    LoggerUtil.instance().logApi(
      level: Level.info,
      type: ApiType.response,
      url: url,
      method: method,
      code: code,
      data: convertDynamicMap(data),
    );

    return handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    LoggerUtil.instance().logApi(
      level: Level.error,
      type: ApiType.response,
      url: err.requestOptions.baseUrl,
      method: err.requestOptions.method,
      code: err.response?.statusCode ?? -1,
      data: {'message': err.message},
    );

    return handler.next(err);
  }
}
