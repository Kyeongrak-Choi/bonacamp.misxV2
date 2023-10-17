import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/models/common/chart_spot.dart';

part 'report_monthly_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class ReportMonthlyModel {
  var branchCode; // 사업장 코드
  var code; // 영업사원코드
  var name; // 영업사원명
  ChartSpot sales; // 월별 매출
  var total;

  ReportMonthlyModel(this.branchCode, this.code, this.name, this.sales, this.total); // 매출 합계

  Map<String, dynamic> toMap() {
    return {
      'branch-code': branchCode,
      'code': code,
      'name': name,
      'sales': sales,
      'total': total,
    };
  }

  factory ReportMonthlyModel.fromJson(Map<String, dynamic> json) => _$ReportMonthlyModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReportMonthlyModelToJson(this);
}
