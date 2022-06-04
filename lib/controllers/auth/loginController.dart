import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var user = {}.obs;

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  getUser() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var userObject = localStorage.getString('user')!;
    user.value = json.decode(userObject);
  }

  logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.clear();
  }
}
