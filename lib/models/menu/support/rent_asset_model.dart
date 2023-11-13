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
  var memo;

  RentAssetModel(this.date, this.code, this.name, this.amount, this.type, this.serialNo, this.memo); // 비고

}
