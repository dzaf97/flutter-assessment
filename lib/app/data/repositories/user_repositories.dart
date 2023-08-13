import 'package:flutter_assessment/app/data/model/rf_infinite/user.dart';
import 'package:flutter_assessment/app/data/provider/rf_infinite_provider.dart';
import 'package:get/get.dart';

class UserRepo {
  final _rfInfiniteProvider = Get.find<RfInfiniteProvider>();

  getAllUser() => _rfInfiniteProvider.getUser(null);
  getSingleUser(int userId) => _rfInfiniteProvider.getUser(userId);
  addUser(User request) => _rfInfiniteProvider.postUser(request);
  editUser(User request, int id) => _rfInfiniteProvider.putUser(request, id);
}
