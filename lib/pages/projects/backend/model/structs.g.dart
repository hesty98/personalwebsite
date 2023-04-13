// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectContent _$ProjectContentFromJson(Map<String, dynamic> json) =>
    ProjectContent(
      json['id'] as String,
      json['title'] as String,
      DescribedThing.fromJson(json['shortDescription'] as Map<String, dynamic>),
      json['longDescription'] == null
          ? null
          : PlainTextDescription.fromJson(
              json['longDescription'] as Map<String, dynamic>),
      DateTime.parse(json['projectStart'] as String),
      (json['descriptions'] as List<dynamic>)
          .map((e) => DescribedThing.fromJson(e as Map<String, dynamic>))
          .toList(),
      webUrl: json['webUrl'] as String?,
      instagramName: json['instagramName'] as String?,
    );

Map<String, dynamic> _$ProjectContentToJson(ProjectContent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'shortDescription': instance.shortDescription,
      'longDescription': instance.longDescription,
      'projectStart': instance.projectStart.toIso8601String(),
      'webUrl': instance.webUrl,
      'instagramName': instance.instagramName,
      'descriptions': instance.descriptions,
    };
