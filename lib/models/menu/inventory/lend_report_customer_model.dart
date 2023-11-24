import 'package:json_annotation/json_annotation.dart';

import 'lend_report_customer_list_model.dart';

part 'lend_report_customer_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class LendReportCustomerModel {
  var code; // 거래처 코드
  var name; // 거래처 명
  List<LendReportCustomerListModel> detailList;
  int? id;

  LendReportCustomerModel(this.code, this.name, this.detailList, {this.id});

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'list': detailList,
    };
  }

  factory LendReportCustomerModel.fromJson(Map<String, dynamic> json) => _$LendReportCustomerModelFromJson(json);

  Map<String, dynamic> toJson() => _$LendReportCustomerModelToJson(this);
}

List<LendReportCustomerModel> generateLendReportCustomerModelList(dataList, count) {
  return List.generate(
      count,
      (index) => LendReportCustomerModel(
            dataList[index].code,
            dataList[index].name,
            dataList[index].detailList,
            id: index,
          ));
}
