import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/models/menu/sales/salesperson_report_monthly/sales_list_model.dart';

part 'salesperson_report_monthly_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class SalesPersonReportMonthlyModel {
  var branchCode; // 사업장 코드
  var code; // 영업사원코드
  var name; // 영업사원명
  List<SalesListModel> sales; // 월별 매출
  var total; // 매출 합계
  int? id;

  SalesPersonReportMonthlyModel(
      this.branchCode, this.code, this.name, this.sales, this.total,
      {this.id});

  Map<String, dynamic> toMap() {
    return {
      'branch-code': branchCode,
      'code': code,
      'name': name,
      'sales': sales,
      'total': total,
    };
  }

  factory SalesPersonReportMonthlyModel.fromJson(Map<String, dynamic> json) =>
      _$SalesPersonReportMonthlyModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesPersonReportMonthlyModelToJson(this);
}

List<SalesPersonReportMonthlyModel> generateSalesPersonReportMonthlyList(
    dataList, count) {
  return List.generate(
      count,
      (index) => SalesPersonReportMonthlyModel(
            dataList[index].branchCode,
            dataList[index].code,
            dataList[index].name,
            dataList[index].sales,
            dataList[index].total,
            id: index,
          ));
}
