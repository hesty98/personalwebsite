
import 'package:flutter/material.dart';
import 'package:privatewebsite/shared/ui/base/page.dart';
import 'package:responsive_builder/responsive_builder.dart';

class InterestPage extends ResponsivePage{
  @override
  Widget buildBody(BuildContext context, SizingInformation sizingInformation, ResponsiveState state) {
    return Text("Interests");
  }

}