import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assessment/app/core/theme/theme.dart';
import 'package:flutter_assessment/app/global_widgets/app_button.dart';
import 'package:flutter_assessment/app/global_widgets/app_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            const SizedBox(height: 40),
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
                      onPressed: () => controller.editPhoto(),
                      icon: SvgPicture.asset(
                        'assets/svg/edit_profile.svg',
                        width: 50,
                      )),
                ),
              ],
            ),
            const SizedBox(height: 20),
            AppTextField(
              isRequired: true,
              fieldName: 'First Name',
              controller: controller.firstName,
              validator: (String? value) {
                if (value!.isEmpty || value == '') {
                  return 'First name is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            AppTextField(
              isRequired: true,
              fieldName: 'Last Name',
              controller: controller.lastName,
              validator: (String? value) {
                if (value!.isEmpty || value == '') {
                  return 'Last name is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            AppTextField(
              fieldName: 'Email',
              controller: controller.email,
              validator: (String? value) {
                if (value!.isNotEmpty) {
                  if (!EmailValidator.validate(value)) {
                    return 'Invalid email format';
                  }
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            AppButton(
              title: 'Done',
              onPressed: () => controller.onDone(),
            )
          ],
        ),
      ),
    );
  }
}
