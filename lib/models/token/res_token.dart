import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/models/token/server.dart';
import 'package:misxV2/models/token/token.dart';

part 'res_token.g.dart'; // *.g.dart : in same directory

// 거래처 검색 Model
@JsonSerializable(explicitToJson: true)
class ResTokenModel {
  ToKenModel token; //
  List<ServerModel> server;

  ResTokenModel(
    this.token,
    this.server,
  ); //

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'server': server,
    };
  }

  factory ResTokenModel.fromJson(Map<String, dynamic> json) => _$ResTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$ResTokenModelToJson(this);
}
