import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart'; // *.g.dart : in same directory

// Token - Token Model
@JsonSerializable(explicitToJson: true)
class ToKenModel {
  String grant_type; //
  String access_token; //
  int access_token_expiration_time; //
  String issue_date; //

  ToKenModel(
    this.grant_type,
    this.access_token,
    this.access_token_expiration_time,
    this.issue_date,
  );

  Map<String, dynamic> toMap() {
    return {
      'grant-type': grant_type,
      'access-token': access_token,
      'access-token_EXPIRATION_TIME': access_token_expiration_time,
      'issue-date': issue_date,
    };
  }

  factory ToKenModel.fromJson(Map<String, dynamic> json) => _$ToKenModelFromJson(json);

  Map<String, dynamic> toJson() => _$ToKenModelToJson(this);
}
