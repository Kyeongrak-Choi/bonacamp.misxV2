import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/models/menu/sales/sales_ledger/sales_ledger_list_model.dart';

part 'sales_ledger_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class SalesLedgerModel {
  var code; // 영업사원 코드
  var name; // 영업사원 명
  List<SalesLedgerListModel> dateList;
  int? id;

  SalesLedgerModel(this.code, this.name, this.dateList, {this.id});

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'list': dateList,
    };
  }

  factory SalesLedgerModel.fromJson(Map<String, dynamic> json) =>
      _$SalesLedgerModelFromJson(json);

  Map<String, dynamic> toJson() => _$SalesLedgerModelToJson(this);
}

List<SalesLedgerModel> generateSalesLedgerModelList(dataList, count) {
  return List.generate(
      count,
      (index) => SalesLedgerModel(
            dataList[index].code,
            dataList[index].name,
            dataList[index].dateList,
            id: index,
          ));
}
