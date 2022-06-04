import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import 'package:wota/controllers/tankController.dart';

import '../../controllers/realtime/firebaseController.dart';
import 'charts.dart';

class IndiTank extends StatefulWidget {
  int capacity;
  var data;

  IndiTank({Key? key, required this.capacity, required this.data})
      : super(key: key);

  @override
  State<IndiTank> createState() => _IndiTankState();
}

class _IndiTankState extends State<IndiTank> {
  String data1 = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TankController tcontroller = Get.find();

    final height = MediaQuery.of(context).size.height;

    final width = MediaQuery.of(context).size.width;
    RealdataController dataController = Get.find();

    return Scaffold(
      body: Obx(() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: height * 0.46,
                width: width,
                child: LiquidCircularProgressIndicator(
                  value: dataController.data.value, // Defaults to 0.5.
                  valueColor: AlwaysStoppedAnimation(Color.fromARGB(
                      255,
                      108,
                      175,
                      219)), // Defaults to the current Theme's accentColor.
                  backgroundColor: Colors
                      .white, // Defaults to the current Theme's backgroundColor.
                  borderColor: Color.fromARGB(255, 117, 115, 115),
                  borderWidth: 2.0,

                  direction: Axis
                      .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Get.to(Charts()),
              child: Container(child: Text("Check charts")),
            ),
            Text(dataController.data.toString())
          ],
        );
      }),
    );
  }
}

//TODO  SHOW THE NUMBER OF BUCKETS LEFTS, CURRENT VOLUME AND CAPACITY JUST USE THE SAME DESIGNED TILE 