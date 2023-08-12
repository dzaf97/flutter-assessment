import 'package:flutter_assessment/app/data/provider/rf_infinite_provider.dart';
import 'package:get/get.dart';

class UserRepo {
  final _rfInfiniteProvider = Get.find<RfInfiniteProvider>();

  getAllUser() => _rfInfiniteProvider.getUser(null);
  getSingleUser(int userId) => _rfInfiniteProvider.getUser(userId);
}
