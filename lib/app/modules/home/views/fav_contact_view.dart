import 'package:flutter/material.dart';
import 'package:flutter_assessment/app/modules/home/controllers/home_controller.dart';

import 'package:get/get.dart';

import '../local_widgets/contact_tile.dart';

class FavContactView extends GetView<HomeController> {
  const FavContactView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => ListView(
          children: controller.favoriteUsers
              .map(
                (user) => ContactTile(
                  user: user,
                  onDelete: () => controller.onDeleteUser(user.id!),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
