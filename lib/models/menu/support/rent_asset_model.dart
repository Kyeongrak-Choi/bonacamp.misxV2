import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/utils/utility.dart';

part 'rent_asset_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class RentAssetModel {
  var date; // 대여일자
  var code; // 자산코드
  var name; // 자산명
  var amount; // 지원금액
  var type; // 자산구분
  var serialNo; // 시리얼 No
  var memo; // 비고
  int? id;

  RentAssetModel(this.date, this.code, this.name, this.amount, this.type, this.serialNo, this.memo,
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
    };
  }

  factory RentAssetModel.fromJson(Map<String, dynamic> json) => _$RentAssetModelFromJson(json);

}

List<RentAssetModel> generateRentAssetList(dataList, count) {
  return List.generate(
      count,
          (index) => RentAssetModel(
            dataList[index].date,
            dataList[index].code,
            dataList[index].name,
            numberFormat.format(dataList[index].amount),
            dataList[index].type,
            dataList[index].serialNo,
            dataList[index].memo,
            id: index,
      ));
}
