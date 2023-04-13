import 'package:json_annotation/json_annotation.dart';

part 'structs.g.dart';

@JsonSerializable()
class HomePageContent {
  final String greeting;
  final String nameIntroduction;
  final String shortText;
  static const String imagePath = "assets/image_of_me.png";
  static const  String backgroundImagePath = "assets/home_page_image_background.svg";

  HomePageContent(this.greeting, this.nameIntroduction, this.shortText);

  factory HomePageContent.fromJson(Map<String, dynamic> json) => _$HomePageContentFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$HomePageContentToJson(this);
}
