import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assessment/app/core/theme/theme.dart';
import 'package:flutter_assessment/app/global_widgets/app_button.dart';
import 'package:flutter_assessment/app/global_widgets/app_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
                        child: (controller.file.value == null)
                            ? (controller.user.value?.avatar != null)
                                ? Image.network(
                                    controller.user.value!.avatar!,
                                    scale: 0.9,
                                  )
                                : const Icon(
                                    Icons.person_2_sharp,
                                    size: 100,
                                    color: Colors.white,
                                  )
                            : Image.file(
                                File(controller.file.value!.path),
                                width: 300,
                                height: 300,
                              ),
                      )),
                ),
                Positioned(
                  bottom: 0,
                  right: Get.width * 0.33,
                  child: IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title: "Select attachment source",
                          titlePadding:
                              const EdgeInsets.fromLTRB(20, 20, 20, 10),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconWithName(
                                onTap: () async {
                                  final ImagePicker picker = ImagePicker();
                                  var image = await picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (image != null) {
                                    XFile _file = XFile(image.path);
                                    controller.file.value = _file;
                                  }
                                  Get.back();
                                },
                                icon: Icons.image,
                                title: "Image",
                              ),
                              IconWithName(
                                onTap: () async {
                                  final ImagePicker picker = ImagePicker();
                                  var image = await picker.pickImage(
                                      source: ImageSource.camera);
                                  if (image != null) {
                                    XFile _file = XFile(image.path);
                                    controller.file.value = _file;
                                  }
                                  Get.back();
                                },
                                icon: Icons.camera_alt,
                                title: "Camera",
                              ),
                            ],
                          ),
                        );
                      },
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

class IconWithName extends StatelessWidget {
  const IconWithName({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.title,
  }) : super(key: key);

  final Function() onTap;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
            color: AppColor.primary,
          ),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
