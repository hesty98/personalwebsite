// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CareerContent _$CareerContentFromJson(Map<String, dynamic> json) =>
    CareerContent(
      json['greeting'] as String,
      (json['events'] as List<dynamic>)
          .map((e) => LifeEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['knowledges'] as List<dynamic>)
          .map((e) => KnowledgeGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CareerContentToJson(CareerContent instance) =>
    <String, dynamic>{
      'greeting': instance.greeting,
      'events': instance.events,
      'knowledges': instance.knowledges,
    };

LifeEvent _$LifeEventFromJson(Map<String, dynamic> json) => LifeEvent(
      json['title'] as String,
      json['publicEntity'] == null
          ? null
          : PublicEntity.fromJson(json['publicEntity'] as Map<String, dynamic>),
      json['description'] == null
          ? null
          : PlainTextDescription.fromJson(
              json['description'] as Map<String, dynamic>),
      TimeRangeDescription.fromJson(json['timeOfWork'] as Map<String, dynamic>),
      const CategoryJsonConverter().fromJson(json['category'] as String),
      (json['bulletPoints'] as List<dynamic>)
          .map((e) => BulletPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['additionalInfo'] as List<dynamic>)
          .map((e) => DescribedThing.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LifeEventToJson(LifeEvent instance) => <String, dynamic>{
      'title': instance.title,
      'publicEntity': instance.publicEntity,
      'description': instance.description,
      'timeOfWork': instance.timeOfWork,
      'category': const CategoryJsonConverter().toJson(instance.category),
      'bulletPoints': instance.bulletPoints,
      'additionalInfo': instance.additionalInfo,
    };

KnowledgeGroup _$KnowledgeGroupFromJson(Map<String, dynamic> json) =>
    KnowledgeGroup(
      json['title'] as String,
      (json['knowledge'] as List<dynamic>)
          .map((e) => RatedThing.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$KnowledgeGroupToJson(KnowledgeGroup instance) =>
    <String, dynamic>{
      'title': instance.title,
      'knowledge': instance.knowledge,
    };
