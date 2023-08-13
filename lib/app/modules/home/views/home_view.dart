import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assessment/app/core/theme/theme.dart';
import 'package:flutter_assessment/app/modules/home/views/all_contact_view.dart';
import 'package:flutter_assessment/app/modules/home/views/fav_contact_view.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Contacts'),
          centerTitle: true,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () => controller.onSyncContact(),
              icon: const Icon(Icons.sync),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: const Color(0xFFE6E6E6),
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                ),
                child: TextField(
                  controller: controller.searchContact,
                  onChanged: (value) => controller.onSearchContact(value),
                  decoration: const InputDecoration(
                    hintText: 'Search Contact',
                    hintStyle: TextStyle(),
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    suffixIcon:
                        Icon(Icons.search, size: 30, color: Colors.grey),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: ButtonsTabBar(
                backgroundColor: AppColor.primary,
                borderColor: AppColor.primary,
                buttonMargin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                labelStyle: const TextStyle(
                  color: Colors.white,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                unselectedBackgroundColor: Colors.white,
                unselectedLabelStyle: const TextStyle(
                  color: Color(0xFF1B1A57),
                ),
                onTap: (tab) => controller.selectedTab.value = tab,
                tabs: const [
                  Tab(text: 'All'),
                  Tab(text: 'Favorite'),
                ],
              ),
            ),
            Obx(
              () => [
                const AllContactView(),
                const FavContactView(),
              ][controller.selectedTab.value],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
        ),
      ),
    );
  }
}
