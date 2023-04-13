import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:privatewebsite/future_libs/descriptum_patronum/model/converters.dart';
import 'package:privatewebsite/future_libs/descriptum_patronum/model/structs.dart';

part 'structs.g.dart';

@JsonSerializable()
class CareerContent {
  final String greeting;
  final List<LifeEvent> events;
  final List<KnowledgeGroup> knowledges;

  CareerContent(this.greeting, this.events, this.knowledges);

  factory CareerContent.fromJson(Map<String, dynamic> json) => _$CareerContentFromJson(json);

  Map<String, dynamic> toJson() => _$CareerContentToJson(this);
}

enum Category { education, career, social, projects }

@CategoryJsonConverter()
@JsonSerializable()
class LifeEvent {
  final String title;
  final PublicEntity? publicEntity;
  final PlainTextDescription? description;
  final TimeRangeDescription timeOfWork;
  final Category category;
  final List<BulletPoint> bulletPoints;

  // meant for tabular ui like in yellow-info box on project-page
  final List<DescribedThing> additionalInfo;

  LifeEvent(this.title,this.publicEntity, this.description, this.timeOfWork, this.category, this.bulletPoints, this.additionalInfo);

  factory LifeEvent.fromJson(Map<String, dynamic> json) => _$LifeEventFromJson(json);

  Map<String, dynamic> toJson() => _$LifeEventToJson(this);


}

@JsonSerializable()
class KnowledgeGroup {
  final String title;
  final List<RatedThing> knowledge;

  KnowledgeGroup(this.title, this.knowledge);

  factory KnowledgeGroup.fromJson(Map<String, dynamic> json) => _$KnowledgeGroupFromJson(json);

  Map<String, dynamic> toJson() => _$KnowledgeGroupToJson(this);
}
