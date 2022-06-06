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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Container(
                height: height * 0.46,
                width: width,
                child: LiquidCircularProgressIndicator(
                  value: dataController.data.value, // Defaults to 0.5.
                  valueColor: AlwaysStoppedAnimation(dataController.data.value <
                          0.2
                      ? Color.fromARGB(255, 134, 34, 34)
                      : Color.fromARGB(255, 108, 175,
                          219)), // Defaults to the current Theme's accentColor.
                  backgroundColor: Colors
                      .white, // Defaults to the current Theme's backgroundColor.
                  borderColor: Color.fromARGB(255, 255, 255, 255),
                  borderWidth: 2.0,

                  direction: Axis
                      .vertical, // The direction the liquid moves (Axis.vertical = bottom to top, Axis.horizontal = left to right). Defaults to Axis.vertical.
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                margin: const EdgeInsets.only(bottom: 32),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 80, 171, 245),
                      Color.fromARGB(255, 8, 77, 134)
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 30, 147, 243).withOpacity(0.4),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(4, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: height * 0.006,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        // Switch(
                        //   onChanged: (bool value) {},
                        //   value: true,
                        //   activeColor: Colors.white,
                        // ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        // Column(
                        //   children: [
                        //     Text(
                        //       "Capacity",
                        //       style: TextStyle(
                        //         color: Colors.white,
                        //         fontFamily: 'avenir',
                        //         fontSize: 15,
                        //       ),
                        //     ),
                        //     Text(
                        //       "${dataController.data.toString()}",
                        //       style: TextStyle(
                        //           color: Colors.white,
                        //           fontFamily: 'avenir',
                        //           fontSize: 24,
                        //           fontWeight: FontWeight.w700),
                        //     ),
                        //   ],
                        // ),
                        Column(
                          children: [
                            Text(
                              "Buckets",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'avenir',
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "${dataController.buckets.round().toString()}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'avenir',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Water Used",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'avenir',
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "${dataController.re_volume.round().toString()}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'avenir',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Water remaining",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'avenir',
                                fontSize: 15,
                              ),
                            ),
                            Text(
                              "${dataController.use_volume.round().toString()}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'avenir',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        )

                        // IconButton(
                        //     icon: Icon(Icons.delete),
                        //     color: Colors.white,
                        //     onPressed: () {
                        //       deleteAlarm(alarm.id);
                        //     }),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Get.to(Charts()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(child: Text("Tap to Check charts")),
                  Icon(
                    Icons.trending_up_rounded,
                    color: Colors.blue,
                    size: 24,
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

//TODO  SHOW THE NUMBER OF BUCKETS LEFTS, CURRENT VOLUME AND CAPACITY JUST USE THE SAME DESIGNED TILE 