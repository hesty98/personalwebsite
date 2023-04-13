// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'structs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomePageContent _$HomePageContentFromJson(Map<String, dynamic> json) =>
    HomePageContent(
      json['greeting'] as String,
      json['nameIntroduction'] as String,
      json['shortText'] as String,
    );

Map<String, dynamic> _$HomePageContentToJson(HomePageContent instance) =>
    <String, dynamic>{
      'greeting': instance.greeting,
      'nameIntroduction': instance.nameIntroduction,
      'shortText': instance.shortText,
    };
