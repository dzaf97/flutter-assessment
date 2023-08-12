import 'package:flutter/material.dart';
import 'package:flutter_assessment/app/core/theme/theme.dart';
import 'package:flutter_assessment/app/data/provider/rf_infinite_provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  Get.put(RfInfiniteProvider());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Assessment",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: primaryTheme,
    ),
  );
}
