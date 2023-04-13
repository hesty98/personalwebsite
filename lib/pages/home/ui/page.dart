import 'dart:math';

import 'package:flutter/material.dart';
import 'package:privatewebsite/pages/home/backend/model/structs.dart';
import 'package:privatewebsite/shared/ui/base/page.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends ResponsivePage {
  @override
  Widget buildBody(BuildContext context, SizingInformation sizingInformation, ResponsiveState state) {
    final theme = Theme.of(context);
    return FutureBuilder<HomePageContent>(
        future: getContent(context),
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return const SizedBox(
              height: 60,
              width: 60,
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: [
              Row(
                mainAxisAlignment: state == ResponsiveState.Small ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      AnimatedSize(
                        duration: const Duration(milliseconds: 10),
                        child: SvgPicture.asset(
                          HomePageContent.backgroundImagePath,
                          width: sizingInformation.localWidgetSize.width * (state == ResponsiveState.Small ? 0.4:0.3),
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: sizingInformation.localWidgetSize.width * 0.03),
                        child: ClipOval(
                          child: Image.asset(
                            HomePageContent.imagePath,
                            width: sizingInformation.localWidgetSize.width * (state == ResponsiveState.Small ? 0.2:0.15),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: sizingInformation.localWidgetSize.width * 0.2,
                    child: Column(
                      children: [
                        Text(
                          data.greeting,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontSize: FontSizeMaker.getFontSize(
                              sizingInformation.localWidgetSize.width,
                              ResponsiveFontSize.bodyLarge,
                            ),
                          ),
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                        const SizedBox(height: 40),
                        Text(
                          data.nameIntroduction,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            fontSize: FontSizeMaker.getFontSize(
                              sizingInformation.localWidgetSize.width,
                              ResponsiveFontSize.bodyLarge,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 100),
              Text(
                data.shortText,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: FontSizeMaker.getFontSize(
                    sizingInformation.localWidgetSize.width,
                    ResponsiveFontSize.bodyLarge,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
              Text("TikTakToe")
            ],
          );
        });
  }

  Future<HomePageContent> getContent(BuildContext context) async {
    return Future.value(
      HomePageContent(
        "Herzlich willkommen in meiner kleinen Ecke des Internets!",
        "Ich bin Linus",
        "Hier erzähle ich der Welt ein wenig über mich oder spiele mit neuen Technologien rum und habe einfach meinen Spaß.",
      ),
    );
  }
}
