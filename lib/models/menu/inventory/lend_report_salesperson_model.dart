import 'package:json_annotation/json_annotation.dart';

import 'lend_report_customer_model.dart';

part 'lend_report_salesperson_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class LendReportSalespersonModel {
  var salesRepCode; // 거래처 코드
  var salesRep; // 거래처 명
  List<LendReportCustomerModel> salespersonList;
  int? id;

  LendReportSalespersonModel(this.salesRepCode, this.salesRep, this.salespersonList, {this.id});

  Map<String, dynamic> toMap() {
    return {
      'sales-rep-code': salesRepCode,
      'sales-rep': salesRep,
      'sales': salespersonList,
    };
  }

  factory LendReportSalespersonModel.fromJson(Map<String, dynamic> json) => _$LendReportSalespersonModelFromJson(json);

  Map<String, dynamic> toJson() => _$LendReportSalespersonModelToJson(this);
}

List<LendReportSalespersonModel> generateLendReportCustomerModelList(dataList, count) {
  return List.generate(
      count,
      (index) => LendReportSalespersonModel(
            dataList[index].salesRepCode,
            dataList[index].salesRep,
            dataList[index].salespersonList,
            id: index,
          ));
}

