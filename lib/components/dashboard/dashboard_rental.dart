// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:misxV2/utils/utility.dart';
//
// import '../../layouts/appframe/dashboard_status.dart';
// import '../common/field/icon_title_field.dart';
//
// class DashBoardRental extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Get.put(DashBoardController());
//     return GetBuilder<DashBoardController>(builder: (DashBoardController controller) {
//       return Column(
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Container(
//               decoration: BoxDecoration(
//                 color: context.theme.cardColor,
//                 borderRadius: BorderRadius.circular(20),
//                 shape: BoxShape.rectangle,
//               ),
//               child: Column(
//                 children: [
//                   Align(
//                     alignment: AlignmentDirectional(-1, 0),
//                     child: Padding(
//                       padding: EdgeInsetsDirectional.all(20),
//                       child: Text(
//                         'title_rental'.tr,
//                         textAlign: TextAlign.start,
//                         style: context.textTheme.displayLarge,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
//                     child: IconTitleField(
//                       titleName: '대여금계'.tr,
//                       value: controller.controllerRentalModel != null ? numberFormat.format(controller.controllerRentalModel.lendAmt) : '0',
//                       iconData: Icons.label_outlined,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
//                     child: IconTitleField(
//                       titleName: '회수예정금계'.tr,
//                       value: controller.controllerRentalModel != null ? numberFormat.format(controller.controllerRentalModel.inspayLendAmt) : '0',
//                       iconData: Icons.label_outlined,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
//                     child: IconTitleField(
//                       titleName: '회수금계'.tr,
//                       value: controller.controllerRentalModel != null ? numberFormat.format(controller.controllerRentalModel.retrvAmt) : '0',
//                       iconData: Icons.label_outlined,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
//                     child: IconTitleField(
//                       titleName: '미회수금계'.tr,
//                       value: controller.controllerRentalModel != null ? numberFormat.format(controller.controllerRentalModel.remAmt) : '0',
//                       iconData: Icons.label_outlined,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 20),
//                     child: IconTitleField(
//                       titleName: '대여금잔액계'.tr,
//                       value: controller.controllerRentalModel != null ? numberFormat.format(controller.controllerRentalModel.totAmt) : '0',
//                       iconData: Icons.label_outlined,
//                     ),
//                   ),
//                 ],
//               )),
//         ],
//       );
//     });
//   }
// }
