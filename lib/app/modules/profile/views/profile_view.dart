import 'package:flutter/material.dart';
import 'package:flutter_assessment/app/core/theme/theme.dart';
import 'package:flutter_assessment/app/global_widgets/app_button.dart';
import 'package:flutter_assessment/app/routes/app_pages.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () => Get.toNamed(Routes.EDIT_PROFILE, arguments: {
                'id': controller.user.value!.id,
                'isEdit': true,
              }),
              child: const Text(
                'Edit',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: AppColor.primary,
                child: Obx(() => ClipOval(
                      child: (controller.user.value?.avatar != null)
                          ? Image.network(
                              controller.user.value!.avatar!,
                              scale: 0.9,
                            )
                          : const Icon(Icons.person_2_sharp),
                    )),
              ),
              Positioned(
                bottom: 0,
                right: Get.width * 0.33,
                child: IconButton(
                  onPressed: () => controller.favorite(),
                  icon: Obx(() => Icon(
                        Icons.star,
                        size: 40,
                        color: controller.isFav.value
                            ? const Color(0xFFF2C94C)
                            : Colors.grey,
                      )),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() => Text(controller.user.value?.firstName ?? '')),
              const SizedBox(width: 3),
              Obx(() => Text(controller.user.value?.lastName ?? '')),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            color: const Color(0xFFF1F1F1),
            child: Column(
              children: [
                SvgPicture.asset('assets/svg/email.svg'),
                const SizedBox(height: 13),
                Obx(() => Text(controller.user.value?.email ?? '')),
              ],
            ),
          ),
          const SizedBox(height: 15),
          AppButton(
            title: 'Send Email',
            onPressed: () => controller.sendEmail(),
          )
        ],
      ),
    );
  }
}
