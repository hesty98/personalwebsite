import 'package:json_annotation/json_annotation.dart';

part 'structs.g.dart';

@JsonSerializable()
class CareerContent {
  final String greeting;

  factory CareerContent.fromJson(Map<String, dynamic> json) => _$CareerContentFromJson(json);

  CareerContent(this.greeting);

  Map<String, dynamic> toJson() => _$CareerContentToJson(this);
}
