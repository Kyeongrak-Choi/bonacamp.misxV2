import 'package:json_annotation/json_annotation.dart';

part 'chart_spot.g.dart'; // *.g.dart : in same directory

// 차트 Spot 모델
@JsonSerializable(explicitToJson: true)
class ChartSpot {
  var name; // 주제
  var value; // 값

  ChartSpot(this.name, this.value);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
    };
  }

  factory ChartSpot.fromJson(Map<String, dynamic> json) => _$ChartSpotModelFromJson(json);

  Map<String, dynamic> toJson() => _$ChartSpotModelToJson(this);
}
