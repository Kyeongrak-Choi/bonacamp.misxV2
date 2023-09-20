import 'package:json_annotation/json_annotation.dart';

part 'overallreturn.g.dart'; // *.g.dart : in same directory

// token response model
@JsonSerializable(explicitToJson: true)
class OverAllReturnModel {
  String? oTot; // 반납액

  OverAllReturnModel(this.oTot);

  Map<String, dynamic> toMap() {
    return {
      'return-amount': oTot,
    };
  }

  factory OverAllReturnModel.fromJson(Map<String, dynamic> json) => _$OverAllReturnModelFromJson(json);

  Map<String, dynamic> toJson() => _$OverAllReturnModelToJson(this);
}
