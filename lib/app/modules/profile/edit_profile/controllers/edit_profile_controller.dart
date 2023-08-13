import 'package:flutter/material.dart';
import 'package:flutter_assessment/app/core/utils/app_snackbar.dart';
import 'package:flutter_assessment/app/core/utils/verify_response.dart';
import 'package:flutter_assessment/app/data/model/app_error.dart';
import 'package:flutter_assessment/app/data/model/rf_infinite/user.dart';
import 'package:flutter_assessment/app/data/repositories/user_repositories.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  final UserRepo _userRepo;
  EditProfileController(this._userRepo);

  final formKey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
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
    firstName.text = user.value?.firstName ?? '';
    lastName.text = user.value?.lastName ?? '';
    email.text = user.value?.email ?? '';
  }

  editPhoto() {}

  onDone() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    var response = await _userRepo.editUser(
        User(
          firstName: firstName.text,
          lastName: lastName.text,
          email: email.text,
          avatar: '',
        ),
        user.value!.id!);

    if (verifyResponse(response)) {
      AppSnackbar.errorSnackbar(title: (response as AppError).message);
      return;
    }
    AppSnackbar.successSnackbar(title: 'Successfully edit!');
  }
}
