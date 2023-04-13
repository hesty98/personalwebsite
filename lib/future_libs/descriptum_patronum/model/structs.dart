import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:privatewebsite/future_libs/descriptum_patronum/model/converters.dart';

part 'structs.g.dart';

@JsonSerializable()
@ColorJsonConverter()
class DescribedThing {
  final String? title;
  final String? subtitle;
  final Color? color;
  final DescribedThing? category;
  final List<Description> descriptions;

  const DescribedThing({
    this.descriptions = const [],
    this.title,
    this.subtitle,
    this.color,
    this.category,
  });

  factory DescribedThing.fromJson(Map<String, dynamic> json) => _$DescribedThingFromJson(json);

  Map<String, dynamic> toJson() => _$DescribedThingToJson(this);

  List<T> getAbstraction<T extends Description>(){
    final result = List<T>.empty(growable: true);
    descriptions.forEach((element) {
      if(element is T){
        result.add(element);
      }
    });

    return result;
  }
}

enum DescriptionType { PlainText, PublicEntity, AdditionalInfo, BulletPoint, RatedThing }

@JsonSerializable()
@DescriptionTypeJsonConverter()
abstract class Description {
  factory Description() {
    return PlainTextDescription("placeholder");
  }

  abstract DescriptionType type;

  static Description fromJson(Map<String, dynamic> json) {
    final type = DescriptionTypeJsonConverter().fromJson(json["type"]);
    switch (type) {
      case DescriptionType.PlainText:
        return PlainTextDescription.fromJson(json);
      case DescriptionType.PublicEntity:
        return PublicEntity.fromJson(json);
      case DescriptionType.AdditionalInfo:
        return AdditionalInfo.fromJson(json);
      case DescriptionType.BulletPoint:
        return BulletPoint.fromJson(json);
      case DescriptionType.RatedThing:
        return RatedThing.fromJson(json);
    }
  }

  Map<String, dynamic> toJson();
}

@JsonSerializable()
class PlainTextDescription implements Description {
  @override
  DescriptionType type = DescriptionType.PlainText;

  final String text;

  PlainTextDescription(this.text) : super();

  factory PlainTextDescription.fromJson(Map<String, dynamic> json) => _$PlainTextDescriptionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PlainTextDescriptionToJson(this);
}

@JsonSerializable()
class TimeRangeDescription implements Description {
  @override
  DescriptionType type = DescriptionType.PlainText;

  final DateTime start;
  final DateTime? end;

  TimeRangeDescription(this.start, this.end) : super();

  factory TimeRangeDescription.fromJson(Map<String, dynamic> json) => _$TimeRangeDescriptionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TimeRangeDescriptionToJson(this);

  int totalDays() {
    return (end ?? DateTime.now()).difference(start).inDays;
  }
}

@JsonSerializable()
class PublicEntity implements Description {
  @override
  DescriptionType type = DescriptionType.PublicEntity;
  final String entityName;
  final String websiteUrl;

  PublicEntity(this.entityName, this.websiteUrl);

  factory PublicEntity.fromJson(Map<String, dynamic> json) => _$PublicEntityFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$PublicEntityToJson(this);
}

@JsonSerializable()
class AdditionalInfo implements Description {
  @override
  DescriptionType type = DescriptionType.AdditionalInfo;
  final String info;

  factory AdditionalInfo.fromJson(Map<String, dynamic> json) => _$AdditionalInfoFromJson(json);

  AdditionalInfo(this.info);

  @override
  Map<String, dynamic> toJson() => _$AdditionalInfoToJson(this);
}

@JsonSerializable()
class BulletPoint implements Description {
  @override
  DescriptionType type = DescriptionType.BulletPoint;
  final String value;

  BulletPoint(this.value);

  factory BulletPoint.fromJson(Map<String, dynamic> json) => _$BulletPointFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$BulletPointToJson(this);
}

@JsonSerializable()
class RatedThing implements Description {
  @override
  DescriptionType type = DescriptionType.RatedThing;

  final String name;
  final Rating rating;

  RatedThing(this.name, this.rating);

  factory RatedThing.fromJson(Map<String, dynamic> json) => _$RatedThingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RatedThingToJson(this);
}

@JsonSerializable()
class Rating {
  final int max;
  final int value;

  Rating( this.value,this.max,);

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
