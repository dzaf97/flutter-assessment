import 'package:flutter/foundation.dart';
import 'package:flutter_assessment/app/core/utils/verify_response.dart';
import 'package:flutter_assessment/app/data/model/rf_infinite/user.dart';
import 'package:flutter_assessment/app/data/repositories/user_repositories.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final UserRepo _userRepo;
  HomeController(this._userRepo);

  RxInt selectedTab = 0.obs;
  RxList<User> users = RxList();
  RxList<User> favoriteUsers = RxList();

  @override
  void onInit() {
    super.onInit();
  }

  onSyncContact() async {
    var response = await _userRepo.getAllUser();
    if (verifyResponse(response)) return;
    for (var element in (response as List<User>)) {
      element.isFav = RxBool(false);
    }
    users.value = response;
  }

  onDeleteUser(int id) {
    if (kDebugMode) {
      printInfo(info: id.toString());
    }
  }
}
