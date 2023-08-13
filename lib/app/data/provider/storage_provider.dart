import 'dart:convert';

import 'package:flutter_assessment/app/data/model/rf_infinite/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageProvider extends GetxService {
  final box = GetStorage();

  // @override
  // void onInit() async {
  //   super.onInit();
  //   await box.erase();
  // }

  List<User> get users => (box.read('users') != null)
      ? (jsonDecode(box.read('users')) as List<dynamic>)
          .map((e) => User.fromJson(e))
          .toList()
      : [];
  set users(List<User> users) => box.write('users', jsonEncode(users));
}
