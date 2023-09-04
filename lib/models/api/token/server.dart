import 'package:json_annotation/json_annotation.dart';

part 'server.g.dart'; // *.g.dart : in same directory

// Token - Server Model
@JsonSerializable(explicitToJson: true)
class ServerModel {
  String server_code; //
  String server_name; //
  String resource_url; //
  String memo; //
  String status; // 상태
  List<String> role_ids; //

  ServerModel(this.server_code, this.server_name, this.resource_url, this.memo, this.status, this.role_ids); //

  Map<String, dynamic> toMap() {
    return {
      'server-code': server_code,
      'server-name': server_name,
      'resource-url': resource_url,
      'memo': memo,
      'status': status,
      'role-ids': role_ids,
    };
  }

  factory ServerModel.fromJson(Map<String, dynamic> json) => _$ServerModelFromJson(json);

  Map<String, dynamic> toJson() => _$ServerModelToJson(this);
}
