import 'package:flutter/material.dart';
import 'package:flutter_assessment/app/core/theme/theme.dart';
import 'package:flutter_assessment/app/data/model/rf_infinite/user.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ContactTile extends StatelessWidget {
  const ContactTile({
    super.key,
    required this.user,
    required this.onDelete,
  });

  final User user;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.35,
        motion: const ScrollMotion(),
        children: [
          CustomSlidableAction(
            flex: 1,
            onPressed: null,
            backgroundColor: AppColor.secondary,
            foregroundColor: Colors.white,
            child: IconButton(
              splashRadius: 25,
              onPressed: () {},
              icon: SvgPicture.asset('assets/svg/edit.svg'),
            ),
          ),
          Container(
            color: AppColor.secondary,
            child: const VerticalDivider(
              color: Color(0xFFC5E2DE),
              thickness: 3,
              indent: 15,
              endIndent: 15,
            ),
          ),
          CustomSlidableAction(
            flex: 1,
            onPressed: null,
            backgroundColor: AppColor.secondary,
            foregroundColor: Colors.white,
            child: IconButton(
              splashRadius: 25,
              onPressed: () => Get.dialog(DeleteContactDialog(
                onConfirm: onDelete,
              )),
              icon: SvgPicture.asset('assets/svg/delete.svg'),
            ),
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.center,
        child: SizedBox(
          width: Get.width * 0.9,
          child: ListTile(
            splashColor: const Color(0xFF32BAA5),
            onLongPress: () {
              user.isFav!.value = !user.isFav!.value;
              if (user.isFav!.value) {
                Get.snackbar(
                  'Add to favorite!',
                  "${user.firstName!} successfully added to favorite",
                  backgroundColor: AppColor.secondary,
                  snackPosition: SnackPosition.BOTTOM,
                );
              } else {
                Get.snackbar(
                  'Remove from favorite!',
                  "${user.firstName!} successfully removed from favorite",
                  backgroundColor: AppColor.secondary,
                  snackPosition: SnackPosition.BOTTOM,
                );
              }
            },
            leading: CircleAvatar(
              radius: 30,
              child: ClipOval(
                child: (user.avatar != null)
                    ? Image.network(user.avatar!)
                    : Image.asset('assets/images/DP.png'),
              ),
            ),
            title: Row(
              children: [
                Text(user.firstName ?? ''),
                const SizedBox(width: 3),
                Text(user.lastName ?? ''),
                const SizedBox(width: 10),
                Obx(() => (user.isFav!.value)
                    ? SvgPicture.asset('assets/svg/star.svg')
                    : Container())
              ],
            ),
            subtitle: Text(user.email ?? '-'),
            trailing: SvgPicture.asset('assets/svg/Frame.svg'),
          ),
        ),
      ),
    );
  }
}

class DeleteContactDialog extends StatelessWidget {
  const DeleteContactDialog({
    super.key,
    required this.onConfirm,
  });

  final void Function()? onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsPadding: EdgeInsets.zero,
      title: const Text(
        'Are you sure you want to delete this contact?',
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.w400),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 1,
                      color: Color(0xFFDCDCDC),
                    ),
                    right: BorderSide(
                      width: 1,
                      color: Color(0xFFDCDCDC),
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: onConfirm,
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Color(0xFFFD1313)),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      width: 1,
                      color: Color(0xFFDCDCDC),
                    ),
                  ),
                ),
                child: TextButton(
                  onPressed: () => Get.back(),
                  child: const Text('Cancel'),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}