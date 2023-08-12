import 'package:flutter_assessment/app/data/repositories/user_repositories.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(UserRepo()),
    );
  }
}
