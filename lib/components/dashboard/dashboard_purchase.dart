// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../layouts/appframe/dashboard_status.dart';
// import '../../utils/utility.dart';
// import '../common/field/icon_title_field.dart';
//
// class DashBoardPurchase extends StatelessWidget {
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
//                         'title_purchase'.tr,
//                         textAlign: TextAlign.start,
//                         style: context.textTheme.displayLarge,
//                       ),
//                     ),
//                   ),
//                   // dummy
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
//                     child: IconTitleField(
//                       titleName: '매입계'.tr,
//                       value: controller.controllerPurchaseModel != null ? numberFormat.format(controller.controllerPurchaseModel.boTotAmt) : '0',
//                       iconData: Icons.label_outlined,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 0),
//                     child: IconTitleField(
//                       titleName: '공급계'.tr,
//                       value: controller.controllerPurchaseModel != null ? numberFormat.format(controller.controllerPurchaseModel.suppAmt) : '0',
//                       iconData: Icons.label_outlined,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsetsDirectional.fromSTEB(30, 0, 0, 20),
//                     child: IconTitleField(
//                       titleName: '채무계'.tr,
//                       value: controller.controllerPurchaseModel != null ? numberFormat.format(controller.controllerPurchaseModel.grntAmt) : '0',
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
