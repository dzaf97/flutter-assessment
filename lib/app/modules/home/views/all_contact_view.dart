import 'package:flutter/material.dart';
import 'package:flutter_assessment/app/core/theme/theme.dart';
import 'package:flutter_assessment/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../local_widgets/contact_tile.dart';

class AllContactView extends GetView<HomeController> {
  const AllContactView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () => ListView(
          children: controller.users
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
