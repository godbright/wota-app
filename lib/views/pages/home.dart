// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:wota/controllers/auth/loginController.dart';
// import 'package:wota/controllers/realtime/firebaseController.dart';
// import 'package:wota/controllers/tankController.dart';
// import 'package:wota/views/pages/welcome_page.dart';

// import '../../controllers/charts/monthlychart.dart';

// class FirstPage extends StatefulWidget {
//   const FirstPage({Key? key}) : super(key: key);

//   @override
//   State<FirstPage> createState() => _FirstPageState();
// }

// class _FirstPageState extends State<FirstPage> {
//   List pages = [FirstPage(), WelcomePage()];
//   int currentIndex = 0;
//   void onTap(int index) {
//     setState(() {
//       currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final TankController tController = Get.put(TankController());
//     final RealdataController dataController = Get.put(RealdataController());
//     final MonthlyChartController mController =
//         Get.put(MonthlyChartController());
//     final LoginController userController = Get.put(LoginController());
//     return Scaffold(
//         bottomNavigationBar: BottomNavigationBar(
//           onTap: onTap,
//           currentIndex: currentIndex,
//           elevation: 0,
//           selectedItemColor: Colors.black,
//           unselectedItemColor: Colors.grey.withOpacity(0.5),
//           showSelectedLabels: false,
//           items: [
//             BottomNavigationBarItem(label: "Home", icon: Icon(Icons.apps)),
//             BottomNavigationBarItem(
//                 label: "Home", icon: Icon(Icons.calendar_view_month)),
//           ],
//         ),
//         body: pages[currentIndex]);
//   }
// }
