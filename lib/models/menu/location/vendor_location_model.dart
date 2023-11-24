import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/models/menu/location/place_model.dart';
import 'package:misxV2/models/menu/location/vendor_location_list_model.dart';
import 'package:misxV2/utils/utility.dart';

part 'vendor_location_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class VendorLocationModel {
  var code; // 거래처 코드
  var name; // 거래처 명
  var representative; // 대표자명
  VendorLocationListModel location; // 경도, 위도
  var salesRepCode; // 영업담당코드
  var salesRep; // 영업담당자명
  var statusCode; // 거래처 상태
  var status; // 거래처 상태명
  var businessNo; // 사업자 번호
  var salesDate; // 매출 기준일
  var amount; // 당일 매출
  var monthlyAmount; // 당월 매출
  var deposit; // 입금 금액
  var remainDeposit; // 미수잔액
  var rentAmount; // 대여 금액
  var rentBalance; // 대여 잔액
  var balance; // 채권잔액
  var visitCount; // 방문횟수
  var marginRate; // 마진율

  int? id;

  VendorLocationModel(
      this.code,
      this.name,
      this.representative,
      this.location,
      this.salesRepCode,
      this.salesRep,
      this.statusCode,
      this.status,
      this.businessNo,
      this.salesDate,
      this.amount,
      this.monthlyAmount,
      this.deposit,
      this.remainDeposit,
      this.rentAmount,
      this.rentBalance,
      this.balance,
      this.visitCount,
      this.marginRate,
      {this.id});

  Map<String, dynamic> toMap() {
    return {
      'code': code,
      'name': name,
      'representative': representative,
      'location': location,
      'sales-rep-code': salesRepCode,
      'sales-rep': salesRep,
      'status-code': statusCode,
      'status': status,
      'business-no': businessNo,
      'sales-date': salesDate,
      'amount': amount,
      'monthly-amount': monthlyAmount,
      'deposit': deposit,
      'remain-deposit': remainDeposit,
      'rent-amount': rentAmount,
      'rent-balance': rentBalance,
      'balance': balance,
      'visit-count': visitCount,
      'margin-rate': marginRate,
    };
  }

  factory VendorLocationModel.fromJson(Map<String, dynamic> json) => _$VendorLocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$VendorLocationModelToJson(this);
}

List<PlaceModel> generateVendorLocationModelList(dataList, count) {
  return List.generate(
      count,
      (index) => PlaceModel(
            VendorLocationModel(
              dataList[index].code,
              dataList[index].name,
              dataList[index].representative,
              dataList[index].location,
              dataList[index].salesRepCode,
              dataList[index].salesRep,
              dataList[index].statusCode,
              dataList[index].status,
              dataList[index].businessNo,
              dataList[index].salesDate,
              numberFormat.format(dataList[index].amount),
              numberFormat.format(dataList[index].monthlyAmount),
              numberFormat.format(dataList[index].deposit),
              numberFormat.format(dataList[index].remainDeposit),
              numberFormat.format(dataList[index].rentAmount),
              numberFormat.format(dataList[index].rentBalance),
              numberFormat.format(dataList[index].balance),
              dataList[index].visitCount,
              dataList[index].marginRate,
            ),
            name: index.toString(),
            latLng: LatLng(dataList[index].location.longitude, dataList[index].location.latitude),
          ));
}
