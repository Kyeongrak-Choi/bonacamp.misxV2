// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:misxV2/components/common/dialog/logout_check.dart';
//
// import '../../utils/constants.dart';
//
// class DrawerMenu extends StatelessWidget {
//   const DrawerMenu({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//         child: Container(
//       color: Colors.white,
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           const DrawerHeader(
//             decoration: BoxDecoration(
//                 color: Color(AppColor),
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(40.0),
//                     bottomRight: Radius.circular(40.0))),
//             child: Text(
//               '보나캠프(주)\n\n개발자',
//               textAlign: TextAlign.start,
//               style: TextStyle(color: Colors.white),
//             ),
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.logout,
//               color: Color(AppColor),
//             ),
//             title: Text(
//               'logout'.tr,
//               style: TextStyle(color: Color(AppColor)),
//             ),
//             onTap: () {
//              LogoutCheckDialog(context);
//             },
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.home,
//               color: Color(AppColor),
//             ),
//             title: Text(
//               'menu1'.tr,
//               style: TextStyle(color: Color(AppColor)),
//             ),
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//           ListTile(
//             leading: Icon(
//               Icons.home,
//               color: Color(AppColor),
//             ),
//             title: Text(
//               'menu2'.tr,
//               style: TextStyle(color: Color(AppColor)),
//             ),
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//     ));
//   }
// }
