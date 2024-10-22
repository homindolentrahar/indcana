// {{#using_equatable}}import 'package:equatable/equatable.dart';{{/using_equatable}}
// import 'package:{{name.snakeCase()}}/cores/services/api/response_parser.dart';

// class BaseResponse<T> {{#using_equatable}} extends Equatable  {{/using_equatable}} {
//   final int? statusCode;
//   final String? message;
//   final Map<String, dynamic>? errors;
//   final T? data;

//   const BaseResponse({
//     this.data,
//     this.statusCode,
//     this.message,
//     this.errors,
//   });

//   factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
//         statusCode: json['statusCode'],
//         message: json['message'],
//         errors: json['errors'],
//         data: json['data'] == null
//             ? null
//             : ResponseParser<T>().fromJson(json['data']),
//       );

//   Map<String, dynamic> toJson() => {
//     'status_code': statusCode,
//     'message': message,
//     'errors': errors,
//     'data': ResponseParser<T>().toJson(data as T),
//   };

//   {{#using_equatable}}
//   @override
//   List<Object?> get props => [data, statusCode, message, errors];
//   {{/using_equatable}}
// }

import 'package:{{name.snakeCase()}}/core/api/response_parser.dart';

class BaseResponse<T> {
  final int? statusCode;
  final String? message;
  final Map<String, dynamic>? errors;
  final T? data;

  const BaseResponse({
    this.data,
    this.statusCode,
    this.message,
    this.errors,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        statusCode: json['statusCode'],
        message: json['message'],
        errors: json['errors'],
        data: json['data'] == null
            ? null
            : ResponseParser<T>().fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'status_code': statusCode,
        'message': message,
        'errors': errors,
        'data': ResponseParser<T>().toJson(data as T),
      };
}
