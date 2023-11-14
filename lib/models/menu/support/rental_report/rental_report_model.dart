import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/models/menu/support/rental_report/rental_report_details_model.dart';

part 'rental_report_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class RentalReportModel {
  var code; // 거래처 코드
  var name; // 거래처 명
  List<RentalReportDetailsModel> detailList;
  int? id;

  RentalReportModel(
      this.code, this.name, this.detailList, {this.id});

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'list': detailList,
    };
  }

  factory RentalReportModel.fromJson(Map<String, dynamic> json) => _$RentalReportModelFromJson(json);

  Map<String, dynamic> toJson() => _$RentalReportModelToJson(this);
}

List<RentalReportModel> generateRentalReportModelList(dataList, count) {
  return List.generate(
      count,
          (index) => RentalReportModel(
        dataList[index].code,
        dataList[index].name,
        dataList[index].detailList,
        id: index,
      ));
}
