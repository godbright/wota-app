import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/tank.dart';
import '../views/pages/individualTank.dart';

class TankTile extends StatefulWidget {
  final Tank tank;
  TankTile(this.tank, {Key? key}) : super(key: key);

  @override
  State<TankTile> createState() => _TankTileState();
}

class _TankTileState extends State<TankTile> {
  var data;

  @override
  Widget build(BuildContext context) {
    // var gradientColor = GradientTemplate
    //                         .gradientTemplate[alarm.gradientColorIndex].colors;
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Get.to(IndiTank(
          capacity: widget.tank.capacity,
          data: data,
        ));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          margin: const EdgeInsets.only(bottom: 32),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
                color: Color.fromARGB(255, 50, 155, 247).withOpacity(0.4),
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
                  Text(
                    widget.tank.company,
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'avenir',
                        fontSize: 20),
                  ),
                ],
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: [
                      Text(
                        "Height",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'avenir',
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        widget.tank.height.toString(),
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
                        "Radius",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'avenir',
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        widget.tank.radius.toString(),
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
                        "Capacity",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'avenir',
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "${widget.tank.capacity.toString()}",
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
    );
  }
}









    //                 Card(
    //   elevation: 2,
    //   child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         GestureDetector(
    //           onTap: () {
    //             Get.to(IndiTank(
    //               capacity: widget.tank.capacity,
    //               data: data,
    //             ));
    //           },
    //           child: Container(
    //             height: height * 0.1,
    //             width: double.infinity,
    //             clipBehavior: Clip.antiAlias,
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(4),
    //             ),
    //             child: Column(
    //               children: [
    //                 Text(widget.tank.company),
    //                 Text(widget.tank.height.toString()),
    //                 Text(widget.tank.capacity.toString())
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );