import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:wota/services/api.dart';

class MonthlyChartController extends GetxController {
  var data = [].obs;

  @override
  void onInit() {
    MonthlyData();
    super.onInit();
  }

  MonthlyData() async {
    var response = await CallApi().getData("MonthlyData/12");
    var rawdata = jsonDecode(response.body);
    data.value = rawdata["data"];
    // data.value = rawdata;
  }
}
