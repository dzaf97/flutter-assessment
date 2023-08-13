import 'package:flutter_assessment/app/core/theme/theme.dart';
import 'package:flutter_assessment/app/core/utils/app_snackbar.dart';
import 'package:flutter_assessment/app/data/model/rf_infinite/user.dart';
import 'package:flutter_assessment/app/modules/home/controllers/home_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileController extends GetxController {
  ProfileController();
  RxBool isFav = false.obs;
  Rx<User?> user = Rx(null);

  @override
  void onInit() async {
    super.onInit();
    await initUser();
  }

  initUser() async {
    user.value = Get.arguments['user'] as User;
    isFav.value = user.value!.isFav!.value;
  }

  sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: user.value?.email ?? '',
    );

    await launchUrl(emailLaunchUri);
  }

  favorite() {
    isFav.value = !isFav.value;
    user.value!.isFav!.value = isFav.value;
    Get.find<HomeController>().initFavoriteUser();
    if (isFav.value) {
      AppSnackbar.successSnackbar(
        title: "${user.value!.firstName!} successfully added to favorite!",
      );
    } else {
      AppSnackbar.successSnackbar(
        title: "${user.value!.firstName!} successfully removed from favorite!",
      );
    }
  }
}
