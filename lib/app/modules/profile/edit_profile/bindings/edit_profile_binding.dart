import 'package:flutter_assessment/app/data/repositories/user_repositories.dart';
import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditProfileController>(
      () => EditProfileController(UserRepo()),
    );
  }
}
