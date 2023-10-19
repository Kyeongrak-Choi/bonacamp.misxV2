import 'package:json_annotation/json_annotation.dart';

part 'notice.g.dart'; // *.g.dart : in same directory

// 공지사항 Model
@JsonSerializable(explicitToJson: true)
class NoticeModel {
  var title; // 제목
  var content; // 내용

  NoticeModel(this.title, this.content);

  Map<String, dynamic> toMap() {
    return {'title': title, 'content': content};
  }

  factory NoticeModel.fromJson(Map<String, dynamic> json) => _$NoticeModelFromJson(json);

  Map<String, dynamic> toJson() => _$NoticeModelToJson(this);
}
