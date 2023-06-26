import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/models/api/token/server.dart';
import 'package:misxV2/models/api/token/token.dart';

part 'res_token.g.dart'; // *.g.dart : in same directory

// 거래처 검색 Model
@JsonSerializable(explicitToJson: true)
class ResTokenModel {
  ToKenModel TOKEN; //
  List<ServerModel> SERVER;

  ResTokenModel(this.TOKEN, this.SERVER,); //

  Map<String, dynamic> toMap() {
    return {
      'TOKEN': TOKEN,
      'SERVER': SERVER,
    };
  }

  factory ResTokenModel.fromJson(Map<String, dynamic> json) => _$ResTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResTokenModelToJson(this);


}