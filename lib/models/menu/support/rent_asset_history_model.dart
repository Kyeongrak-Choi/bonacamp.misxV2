import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/utils/utility.dart';

part 'rent_asset_history_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class RentAssetHistoryModel {
  var date; // 대여일자
  var code; // 자산코드
  var name; // 자산명
  var amount; // 지원금액
  var type; // 자산구분
  var serialNo; // 시리얼 No
  var memo; // 비고
  var status; //
  int? id;

  RentAssetHistoryModel(this.date, this.code, this.name, this.amount, this.type, this.serialNo, this.memo,this.status,
      {this.id});

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'code': code,
      'name': name,
      'amount': amount,
      'type': type,
      'serial-no': serialNo,
      'memo': memo,
      'status': status,
    };
  }

  factory RentAssetHistoryModel.fromJson(Map<String, dynamic> json) => _$RentAssetHistoryModelFromJson(json);

}

List<RentAssetHistoryModel> generateRentAssetHistoryList(dataList, count) {
  return List.generate(
      count,
          (index) => RentAssetHistoryModel(
            dataList[index].date,
            dataList[index].code,
            dataList[index].name,
            numberFormat.format(dataList[index].amount),
            dataList[index].type,
            dataList[index].serialNo,
            dataList[index].memo,
            dataList[index].status,
            id: index,
      ));
}
