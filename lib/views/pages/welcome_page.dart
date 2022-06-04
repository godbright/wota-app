import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wota/services/auth.dart';

import 'home_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF333d94),
        body: Column(
          children: [
            Expanded(
                child: Stack(
              children: [
                Positioned(
                    height: 80,
                    bottom: 80,
                    left: (MediaQuery.of(context).size.width - 200) / 2,
                    right: (MediaQuery.of(context).size.width - 200) / 2,
                    child: GestureDetector(
                        onTap: () {
                          Get.to(AuthPage());
                        },
                        child: Container(
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color(0xFF7179ed),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Get Started',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 26),
                                ),
                              ],
                            ))))
              ],
            ))
          ],
        ));
  }
}
