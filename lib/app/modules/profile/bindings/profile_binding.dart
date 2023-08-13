import 'package:flutter_assessment/app/data/repositories/user_repositories.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(UserRepo()),
    );
  }
}
