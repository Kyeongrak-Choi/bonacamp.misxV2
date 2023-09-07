import 'package:json_annotation/json_annotation.dart';
import 'package:misxV2/models/token/server.dart';
import 'package:misxV2/models/token/token.dart';

part 'req_token.g.dart'; // *.g.dart : in same directory

// 거래처 검색 Model
@JsonSerializable(explicitToJson: true)
class ReqTokenModel {
  String id;
  String password;
  String clientId;

  ReqTokenModel(
      this.id,
      this.password,
      this.clientId,
  ); //

  Map<String, dynamic> toMap() {
    return {
      'id': id
    , 'password': password
    , 'client-id' : clientId,
    };
  }

  factory ReqTokenModel.fromJson(Map<String, dynamic> json) => _$ReqTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReqTokenModelToJson(this);
}
