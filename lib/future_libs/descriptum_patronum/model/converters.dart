
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:privatewebsite/future_libs/descriptum_patronum/model/structs.dart';
import 'package:privatewebsite/pages/career/backend/model/structs.dart';

class ColorJsonConverter implements JsonConverter<Color, int> {
  const ColorJsonConverter();

  @override
  Color fromJson(int json) {
    return Color(json);
  }

  @override
  int toJson(Color object) {
    return object.value;
  }
}

class IconDataJsonConverter implements JsonConverter<IconData, String> {
  const IconDataJsonConverter();

  static const String CODE_POINT = "codePoint";
  static const String FONT_FAMILY = "fontFamily";

  @override
  IconData fromJson(String json) {
    Map<String, dynamic> map = jsonDecode(json);
    return IconData(
      map['codePoint'],
      fontFamily: map['fontFamily'],
      fontPackage: map['fontPackage'],
      matchTextDirection: map['matchTextDirection'],
    );
  }

  @override
  String toJson(IconData data) {
    if (data == null) return "";
    Map<String, dynamic> map = <String, dynamic>{};
    map['codePoint'] = data.codePoint;
    map['fontFamily'] = data.fontFamily;
    map['fontPackage'] = data.fontPackage;
    map['matchTextDirection'] = data.matchTextDirection;
    return jsonEncode(map);
  }
}

class DescriptionTypeJsonConverter implements JsonConverter<DescriptionType, String> {
  const DescriptionTypeJsonConverter();

  @override
  DescriptionType fromJson(String json) {
    for (var element in DescriptionType.values) {
      if(element.name == json) return element;
    }
    throw UnimplementedError("wtf - how json");
  }

  @override
  String toJson(DescriptionType object) {
    return object.name;
  }
}

class CategoryJsonConverter implements JsonConverter<Category, String> {
  const CategoryJsonConverter();

  @override
  Category fromJson(String json) {
    for (var element in Category.values) {
      if(element.name == json) return element;
    }
    throw UnimplementedError("wtf - how json");
  }

  @override
  String toJson(Category object) {
    return object.name;
  }
}