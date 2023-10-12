import 'package:json_annotation/json_annotation.dart';

part 'chart_spot.g.dart'; // *.g.dart : in same directory

// 차트 Spot 모델
@JsonSerializable(explicitToJson: true)
class ChartSpot {
  String name; // 범례
  double value; // 값

  ChartSpot(this.name, this.value);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'value': value,
    };
  }

  factory ChartSpot.fromJson(Map<String, dynamic> json) => _$ChartSpotFromJson(json);

  Map<String, dynamic> toJson() => _$ChartSpotToJson(this);
}
