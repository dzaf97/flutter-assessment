import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

class TextEditConverter extends JsonConverter<TextEditingController, String> {
  const TextEditConverter();

  @override
  TextEditingController fromJson(dynamic json) {
    return TextEditingController(text: json);
  }

  @override
  String toJson(TextEditingController object) => object.text;
}

class BoolConverter extends JsonConverter<bool, int> {
  const BoolConverter();

  @override
  bool fromJson(dynamic json) {
    if (json == 0) {
      return false;
    } else {
      return true;
    }
  }

  @override
  int toJson(bool object) => (object) ? 1 : 0;
}

class RxDateComverter extends JsonConverter<Rx<DateTime>, dynamic> {
  const RxDateComverter();

  @override
  Rx<DateTime> fromJson(dynamic json) {
    return Rx<DateTime>(DateTime.parse(json));
  }

  @override
  dynamic toJson(dynamic object) {
    return (object as Rx<DateTime>).value;
  }
}

class RxStringComverter extends JsonConverter<RxString, dynamic> {
  const RxStringComverter();

  @override
  RxString fromJson(dynamic json) {
    return RxString(json);
  }

  @override
  dynamic toJson(dynamic object) {
    return (object as RxString).value;
  }
}

class RxBoolComverter extends JsonConverter<RxBool, dynamic> {
  const RxBoolComverter();

  @override
  RxBool fromJson(dynamic json) {
    return RxBool(json);
  }

  @override
  dynamic toJson(dynamic object) {
    return (object as RxBool).value;
  }
}
