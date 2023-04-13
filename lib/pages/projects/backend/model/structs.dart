import 'package:json_annotation/json_annotation.dart';
import 'package:privatewebsite/future_libs/descriptum_patronum/model/structs.dart';

part 'structs.g.dart';

@JsonSerializable()
class ProjectContent {
  final String id;
  final String title;
  final DescribedThing shortDescription;
  final PlainTextDescription? longDescription;
  final DateTime projectStart;
  final String? webUrl;
  final String? instagramName;
  final List<DescribedThing> descriptions;

  ProjectContent(
    this.id,
    this.title,
    this.shortDescription,
    this.longDescription,
    this.projectStart,
    this.descriptions, {
    this.webUrl,
    this.instagramName,
  });

  factory ProjectContent.fromJson(Map<String, dynamic> json) => _$ProjectContentFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectContentToJson(this);
}
