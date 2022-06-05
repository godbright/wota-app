import 'package:flutter/material.dart';

import '../Charts/monthlychart.dart';

class Charts extends StatelessWidget {
  const Charts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(
                  child: Text("Daily"),
                ),
                Tab(
                  child: Text("Weekly"),
                ),
                Tab(
                  child: Text("Monthly"),
                ),
              ],
            ),
          ),
          body: const TabBarView(
            children: <Widget>[
              Center(
                child: Text("It's cloudy here"),
              ),
              Center(
                child: Text("It's rainy here"),
              ),
              Center(
                child: MonthlyChartData(),
              ),
            ],
          ),
        ));
  }
}
