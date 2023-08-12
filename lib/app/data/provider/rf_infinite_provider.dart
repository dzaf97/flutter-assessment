import 'dart:convert';

import 'package:flutter_assessment/app/data/model/app_error.dart';
import 'package:flutter_assessment/app/data/model/base_response.dart';
import 'package:flutter_assessment/app/data/model/rf_infinite/user.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_connect.dart';

class RfInfiniteProvider extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = dotenv.env['BASE_URL'];
  }

  getUser(int? userId) async {
    String url = '/users';

    // If get user by id
    if (userId != null) url = '/users/$userId';

    var response = await httpClient.get(url);
    if (response.isOk) {
      try {
        var baseResponse =
            BaseResponse.fromJson(jsonDecode(response.bodyString!));
        return (baseResponse.data as List<dynamic>)
            .map((e) => User.fromJson(e))
            .toList();
      } catch (e) {
        return AppError(message: e.toString());
      }
    } else {
      return AppError(
          message: response.statusText ?? 'Internet connection error');
    }
  }
}
