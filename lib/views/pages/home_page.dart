import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wota/controllers/auth/loginController.dart';
import 'package:wota/controllers/tankController.dart';
import 'package:wota/services/api.dart';
import 'package:wota/widgets/tankTile.dart';

import '../../controllers/charts/monthlychart.dart';
import '../../controllers/realtime/firebaseController.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final TankController tController = Get.put(TankController());
  final RealdataController dataController = Get.put(RealdataController());
  final MonthlyChartController mController = Get.put(MonthlyChartController());
  final LoginController userController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              Text(
                " ${userController.user["name"]}",
                style: TextStyle(
                    color: Color.fromARGB(255, 53, 148, 226), fontSize: 20),
              ),
              Text(
                " ${userController.user["name"]}",
                style: TextStyle(
                    color: Color.fromARGB(255, 20, 19, 19), fontSize: 20),
              ),
            ],
          ),
          Obx(
            () => ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: tController.tankList.length,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    child: TankTile(tController.tankList[index]),
                  );
                }),
          )
        ],
      ),
    )));
  }
}






// Center(
//         child: CarouselSlider(
//           options: CarouselOptions(
//             height: 400,
//             aspectRatio: 16 / 9,
//             viewportFraction: 0.8,
//             initialPage: 0,
//             enableInfiniteScroll: true,
//             reverse: false,
//             autoPlay: true,
//             autoPlayInterval: Duration(seconds: 3),
//             autoPlayAnimationDuration: Duration(milliseconds: 800),
//             autoPlayCurve: Curves.fastOutSlowIn,
//             enlargeCenterPage: true,
//             scrollDirection: Axis.horizontal,
//           ),
//           items: mController.data.map((i) {
//             return Builder(
//               builder: (BuildContext context) {
//                 return TankTile(tController.tankList[i]);
//               },
//             );
//           }).toList(),
//         ),
//       ),