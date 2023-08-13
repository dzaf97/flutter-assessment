import 'package:flutter_assessment/app/core/utils/verify_response.dart';
import 'package:flutter_assessment/app/data/model/rf_infinite/user.dart';
import 'package:flutter_assessment/app/data/repositories/user_repositories.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileController extends GetxController {
  final UserRepo _userRepo;
  ProfileController(this._userRepo);
  RxBool isFav = false.obs;
  Rx<User?> user = Rx(null);

  @override
  void onInit() async {
    super.onInit();
    await initUser();
  }

  initUser() async {
    int id = Get.arguments['id'];
    var response = await _userRepo.getSingleUser(id);
    if (verifyResponse(response)) return;
    user.value = response as User;
  }

  sendEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'smith@example.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Example Subject & Symbols are allowed!',
      }),
    );

    launchUrl(emailLaunchUri);
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
