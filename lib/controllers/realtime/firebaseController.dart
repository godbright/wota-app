import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RealdataController extends GetxController {
  DatabaseReference ref = FirebaseDatabase.instance.ref("number");

  var isloading = false.obs;
  var data = 0.0.obs;
  var buckets = 0.0.obs;
  var re_volume = 0.0.obs;
  var use_volume = 0.0.obs;

  @override
  void onInit() {
    readData();
    super.onInit();
  }

  void readData() async {
    await ref.onValue.listen((event) {
      String firedata;
      var rawdata;
      var rem_vol;

      firedata = event.snapshot.value.toString();
      if (firedata != null) {
        isloading(false);
      } else {
        isloading(true);
      }
      print(firedata);
      rawdata = double.parse(firedata);
      use_volume.value = ((0.325) * (0.325) * 3.14 * rawdata / 100) * 1000;
      rawdata = 70 - rawdata;
      rawdata = rawdata / 100;
      rem_vol = ((0.325) * (0.325) * 3.14 * rawdata) * 1000;

      re_volume.value = rem_vol;
      data.value = rem_vol / 200;
      buckets.value = rem_vol / 20;
    });
  }
}
