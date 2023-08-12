import 'package:flutter_assessment/app/data/model/converter.dart';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  @RxBoolComverter()
  @JsonKey(includeFromJson: false)
  RxBool? isFav;

  User({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
    this.isFav,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}