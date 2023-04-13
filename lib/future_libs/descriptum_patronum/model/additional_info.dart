
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AdditionalInfo {
  final String infoCategory;
  final List<String> bulletPoints;

  AdditionalInfo(this.infoCategory, this.bulletPoints);
}