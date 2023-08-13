import 'package:flutter/material.dart';
import 'package:flutter_assessment/app/core/theme/theme.dart';
import 'package:get/get.dart';

class AppSnackbar {
  static Future<void> errorSnackbar({
    required String title,
  }) async {
    Get.snackbar(
      'Something went wrong!',
      title,
      icon: const Icon(
        Icons.error,
        color: Colors.white,
      ),
      titleText: const Text(
        'Something went wrong!',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      duration: const Duration(seconds: 5),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: Colors.white,
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }

  static Future<void> successSnackbar({
    required String title,
  }) async {
    Get.snackbar(
      'Success',
      title,
      icon: const Icon(
        Icons.check,
        color: Colors.black,
      ),
      titleText: const Text(
        'Success',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      duration: const Duration(seconds: 5),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColor.secondary,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      colorText: Colors.black,
      isDismissible: true,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}
