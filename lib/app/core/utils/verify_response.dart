import 'package:flutter_assessment/app/data/model/app_error.dart';

bool verifyResponse(response) {
  if (response.runtimeType == AppError) {
    return true;
  } else {
    return false;
  }
}
