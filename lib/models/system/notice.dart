import 'package:json_annotation/json_annotation.dart';

part 'notice.g.dart'; // *.g.dart : in same directory

// 공지사항 Model
@JsonSerializable(explicitToJson: true)
class NoticeModel {
  var title; // 제목
  var content; // 내용
  var regData; // 등록일자

  NoticeModel(this.title, this.content,this.regData);

  Map<String, dynamic> toMap() {
    return {'title': title, 'content': content,'reg-data' : regData};
  }

  factory NoticeModel.fromJson(Map<String, dynamic> json) => _$NoticeModelFromJson(json);

  Map<String, dynamic> toJson() => _$NoticeModelToJson(this);
}
