import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:wota/services/api.dart';

import '../models/tank.dart';

class TankController extends GetxController {
  var tankList = <Tank>[].obs;
  var isloading = true.obs;

  @override
  void onInit() {
    fetchTanks();
    super.onInit();
  }

//TODO pass the user id using the fetchTanks function
  void fetchTanks() async {
    isloading(true);
    var response = await CallApi().getData("tankUser/6");
    if (response != null) {
      tankList.value = tankFromJson(response.body);
    }
    isloading(false);
  }
}
