// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DescribedThing _$DescribedThingFromJson(Map<String, dynamic> json) =>
    DescribedThing(
      descriptions: (json['descriptions'] as List<dynamic>?)
              ?.map((e) => Description.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
      color: _$JsonConverterFromJson<int, Color>(
          json['color'], const ColorJsonConverter().fromJson),
      category: json['category'] == null
          ? null
          : DescribedThing.fromJson(json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DescribedThingToJson(DescribedThing instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'color': _$JsonConverterToJson<int, Color>(
          instance.color, const ColorJsonConverter().toJson),
      'category': instance.category,
      'descriptions': instance.descriptions,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

Description _$DescriptionFromJson(Map<String, dynamic> json) => Description()
  ..type =
      const DescriptionTypeJsonConverter().fromJson(json['type'] as String);

Map<String, dynamic> _$DescriptionToJson(Description instance) =>
    <String, dynamic>{
      'type': const DescriptionTypeJsonConverter().toJson(instance.type),
    };

PlainTextDescription _$PlainTextDescriptionFromJson(
        Map<String, dynamic> json) =>
    PlainTextDescription(
      json['text'] as String,
    )..type = $enumDecode(_$DescriptionTypeEnumMap, json['type']);

Map<String, dynamic> _$PlainTextDescriptionToJson(
        PlainTextDescription instance) =>
    <String, dynamic>{
      'type': _$DescriptionTypeEnumMap[instance.type]!,
      'text': instance.text,
    };

const _$DescriptionTypeEnumMap = {
  DescriptionType.PlainText: 'PlainText',
  DescriptionType.PublicEntity: 'PublicEntity',
  DescriptionType.AdditionalInfo: 'AdditionalInfo',
  DescriptionType.BulletPoint: 'BulletPoint',
  DescriptionType.RatedThing: 'RatedThing',
};

TimeRangeDescription _$TimeRangeDescriptionFromJson(
        Map<String, dynamic> json) =>
    TimeRangeDescription(
      DateTime.parse(json['start'] as String),
      json['end'] == null ? null : DateTime.parse(json['end'] as String),
    )..type = $enumDecode(_$DescriptionTypeEnumMap, json['type']);

Map<String, dynamic> _$TimeRangeDescriptionToJson(
        TimeRangeDescription instance) =>
    <String, dynamic>{
      'type': _$DescriptionTypeEnumMap[instance.type]!,
      'start': instance.start.toIso8601String(),
      'end': instance.end?.toIso8601String(),
    };

PublicEntity _$PublicEntityFromJson(Map<String, dynamic> json) => PublicEntity(
      json['entityName'] as String,
      json['websiteUrl'] as String,
    )..type = $enumDecode(_$DescriptionTypeEnumMap, json['type']);

Map<String, dynamic> _$PublicEntityToJson(PublicEntity instance) =>
    <String, dynamic>{
      'type': _$DescriptionTypeEnumMap[instance.type]!,
      'entityName': instance.entityName,
      'websiteUrl': instance.websiteUrl,
    };

AdditionalInfo _$AdditionalInfoFromJson(Map<String, dynamic> json) =>
    AdditionalInfo(
      json['info'] as String,
    )..type = $enumDecode(_$DescriptionTypeEnumMap, json['type']);

Map<String, dynamic> _$AdditionalInfoToJson(AdditionalInfo instance) =>
    <String, dynamic>{
      'type': _$DescriptionTypeEnumMap[instance.type]!,
      'info': instance.info,
    };

BulletPoint _$BulletPointFromJson(Map<String, dynamic> json) => BulletPoint(
      json['value'] as String,
    )..type = $enumDecode(_$DescriptionTypeEnumMap, json['type']);

Map<String, dynamic> _$BulletPointToJson(BulletPoint instance) =>
    <String, dynamic>{
      'type': _$DescriptionTypeEnumMap[instance.type]!,
      'value': instance.value,
    };

RatedThing _$RatedThingFromJson(Map<String, dynamic> json) => RatedThing(
      json['name'] as String,
      Rating.fromJson(json['rating'] as Map<String, dynamic>),
    )..type = $enumDecode(_$DescriptionTypeEnumMap, json['type']);

Map<String, dynamic> _$RatedThingToJson(RatedThing instance) =>
    <String, dynamic>{
      'type': _$DescriptionTypeEnumMap[instance.type]!,
      'name': instance.name,
      'rating': instance.rating,
    };

Rating _$RatingFromJson(Map<String, dynamic> json) => Rating(
      json['value'] as int,
      json['max'] as int,
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'max': instance.max,
      'value': instance.value,
    };
