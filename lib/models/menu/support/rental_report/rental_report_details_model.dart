import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/utils/utility.dart';

part 'rental_report_details_model.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class RentalReportDetailsModel {
  var sequence;
  var status;
  var divideMonth;
  var interestRate;
  var payLastDate;
  var totalRentalAmount;
  var totalReturnAmount;
  var balance;
  var salesRepCode;
  var salesRepName;
  var rentalAmount;
  var returnAmount;
  var overdueAmount;

  int? id;

  RentalReportDetailsModel(
      this.sequence,
      this.status,
      this.divideMonth,
      this.interestRate,
      this.payLastDate,
      this.totalRentalAmount,
      this.totalReturnAmount,
      this.balance,
      this.salesRepCode,
      this.salesRepName,
      this.rentalAmount,
      this.returnAmount,
      this.overdueAmount,
      {this.id});

  Map<String, dynamic> toMap() {
    return {
      'sequence': sequence,
      'status': status,
      'divide-month': divideMonth,
      'interest-rate': interestRate,
      'pay-last-date': payLastDate,
      'total-rental-amount': totalRentalAmount,
      'total-return-amount': totalReturnAmount,
      'balance': balance,
      'sales-rep-code': salesRepCode,
      'sales-rep-name': salesRepName,
      'rental-amount': rentalAmount,
      'return-amount': returnAmount,
      'overdue-amount': overdueAmount,
    };
  }

  factory RentalReportDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$RentalReportDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$RentalReportDetailsModelToJson(this);
}

List<RentalReportDetailsModel> generateRentalReportDetailsModellList(
    dataList, count) {
  return List.generate(
      count,
      (index) => RentalReportDetailsModel(
            dataList[index].sequence,
            dataList[index].status,
            dataList[index].divideMonth,
            dataList[index].interestRate,
            dataList[index].payLastDate,
            numberFormat.format(dataList[index].totalRentalAmount),
            numberFormat.format(dataList[index].totalReturnAmount),
            numberFormat.format(dataList[index].balance),
            dataList[index].salesRepCode,
            dataList[index].salesRepName,
            numberFormat.format(dataList[index].rentalAmount),
            numberFormat.format(dataList[index].returnAmount),
            numberFormat.format(dataList[index].overdueAmount),
            id: index,
          ));
}
