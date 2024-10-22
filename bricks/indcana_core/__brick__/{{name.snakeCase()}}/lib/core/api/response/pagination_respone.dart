// {{#using_equatable}}import 'package:equatable/equatable.dart';{{/using_equatable}}

// class Pagination {{#using_equatable}} extends Equatable  {{/using_equatable}} {
//   final int? currentPage;
//   final int? from;
//   final int? lastPage;
//   final int? perPage;
//   final int? to;
//   final int? total;
//   final int? limit;
//   final int? totalPage;
//   final int? totalRows;

//   const Pagination({
//     this.currentPage,
//     this.from,
//     this.lastPage,
//     this.perPage,
//     this.to,
//     this.total,
//     this.limit,
//     this.totalPage,
//     this.totalRows,
//   });

//   factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
//         currentPage: json['current_page'],
//         from: json['from'],
//         lastPage: json['last_page'],
//         perPage: json['per_page'],
//         to: json['to'],
//         total: json['total'],
//         limit: json['limit'],
//         totalPage: json['total_page'],
//         totalRows: json['total_rows'],
//       );

//   Map<String, dynamic> toJson() => {
//         'current_page': currentPage,
//         'from': from,
//         'last_page': lastPage,
//         'per_page': perPage,
//         'to': to,
//         'total': total,
//         'limit': limit,
//         'total_page': totalPage,
//         'total_rows': totalRows,
//       };

//   {{#using_equatable}}
//   @override
//   List<Object?> get props => [
//         currentPage,
//         from,
//         lastPage,
//         perPage,
//         to,
//         total,
//         limit,
//         totalPage,
//         totalRows
//       ];
//   {{/using_equatable}}
// }

class PaginationResponse {
  final int? currentPage;
  final int? from;
  final int? lastPage;
  final int? perPage;
  final int? to;
  final int? total;
  final int? limit;
  final int? totalPage;
  final int? totalRows;

  const PaginationResponse({
    this.currentPage,
    this.from,
    this.lastPage,
    this.perPage,
    this.to,
    this.total,
    this.limit,
    this.totalPage,
    this.totalRows,
  });

  factory PaginationResponse.fromJson(Map<String, dynamic> json) =>
      PaginationResponse(
        currentPage: json['current_page'],
        from: json['from'],
        lastPage: json['last_page'],
        perPage: json['per_page'],
        to: json['to'],
        total: json['total'],
        limit: json['limit'],
        totalPage: json['total_page'],
        totalRows: json['total_rows'],
      );

  Map<String, dynamic> toJson() => {
        'current_page': currentPage,
        'from': from,
        'last_page': lastPage,
        'per_page': perPage,
        'to': to,
        'total': total,
        'limit': limit,
        'total_page': totalPage,
        'total_rows': totalRows,
      };
}
