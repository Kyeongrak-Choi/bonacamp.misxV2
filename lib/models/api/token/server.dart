import 'package:json_annotation/json_annotation.dart';

part 'server.g.dart'; // *.g.dart : in same directory

// 거래처 검색 Model
@JsonSerializable(explicitToJson: true)
class ServerModel {
  String SERVER_CODE; //
  String SERVER_NAME; //
  String RESORUCE_URL; //
  String MEMO; //
  List<String> ROLE_IDS;

  ServerModel(this.SERVER_CODE, this.SERVER_NAME, this.RESORUCE_URL, this.MEMO, this.ROLE_IDS); //

  Map<String, dynamic> toMap() {
    return {
      'SERVER_CODE': SERVER_CODE,
      'SERVER_NAME': SERVER_NAME,
      'RESORUCE_URL': RESORUCE_URL,
      'MEMO': MEMO,
      'ROLE_IDS': ROLE_IDS,
    };
  }

  factory ServerModel.fromJson(Map<String, dynamic> json) => _$ServerModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServerModelToJson(this);


}