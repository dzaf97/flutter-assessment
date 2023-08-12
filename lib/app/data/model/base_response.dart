import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class BaseResponse {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  dynamic data;
  Support? support;

  BaseResponse({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class Support {
  String? url;
  String? text;

  Support({
    this.url,
    this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) =>
      _$SupportFromJson(json);

  Map<String, dynamic> toJson() => _$SupportToJson(this);
}
