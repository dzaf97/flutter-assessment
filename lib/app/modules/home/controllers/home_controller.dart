import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assessment/app/core/utils/verify_response.dart';
import 'package:flutter_assessment/app/data/model/rf_infinite/user.dart';
import 'package:flutter_assessment/app/data/provider/storage_provider.dart';
import 'package:flutter_assessment/app/data/repositories/user_repositories.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final UserRepo _userRepo;
  HomeController(this._userRepo);

  RxInt selectedTab = 0.obs;
  RxList<User> users = RxList();
  RxList<User> allUser = RxList();
  RxList<User> favoriteUsers = RxList();
  TextEditingController searchContact = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    users.value = Get.find<StorageProvider>().users;
    allUser.value = users;
    initFavoriteUser();
  }

  initFavoriteUser() {
    favoriteUsers.value =
        users.where((element) => element.isFav!.value).toList();
  }

  onSyncContact() async {
    Get.find<StorageProvider>().users = users;
    var response = await _userRepo.getAllUser();
    if (verifyResponse(response)) return;
    (response as List<User>);
    for (var user in response) {
      int found = Get.find<StorageProvider>()
          .users
          .indexWhere((element) => user.id == element.id);
      if (found == -1) {
        user.isFav = RxBool(false);
        users.add(user);
      }
    }
    Get.find<StorageProvider>().users = users;
  }

  onSearchContact(String value) {
    allUser.value = users
        .where((p0) =>
            "${p0.firstName!.toLowerCase()} ${p0.lastName!.toLowerCase()}"
                .contains(value.toLowerCase()))
        .toList();
  }

  onDeleteUser(int id) {
    if (kDebugMode) {
      printInfo(info: id.toString());
    }
    users.removeWhere((element) => element.id == id);
    Get.find<StorageProvider>().users = users;
    initFavoriteUser();
    Get.back();
  }
}
