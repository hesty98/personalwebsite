import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:privatewebsite/router.dart';
import 'package:privatewebsite/service_locator.dart';
import 'package:url_launcher/url_launcher.dart';

enum LinkWidgetType {
  Website,
  Instagram,
  MoreInfo,
}

class LinkWidget extends HookWidget {
  final LinkWidgetType type;
  final String? url;
  final String? instagramTag;
  final PageRouteInfo? route;

  const LinkWidget(
    this.type, {
    super.key,
    this.url,
    this.instagramTag,
    this.route,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    return InkWell(
      onTap: () async {
        switch (type) {
          case LinkWidgetType.Website:
            if (url != null) {
              launchUrl(Uri.parse(url!));
            }
            break;
          case LinkWidgetType.Instagram:
            if (instagramTag != null) {
              launchUrl(
                Uri.parse("https://instagram.com/$instagramTag/"),
                webOnlyWindowName: "_blank"
              );
            }
            break;
          case LinkWidgetType.MoreInfo:
            if(route != null){
              locator<AppRouter>().push(route!);
            }
            break;
        }
      },
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        margin: const EdgeInsets.only(right: 8),
        decoration: ShapeDecoration(
          color: getBackgroundColor(),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        ),
        child: Center(
          child: Text(
            getTitle(localizations),
            style: TextStyle(fontWeight: FontWeight.bold, color: getTextColor(), fontSize: 20),
          ),
        ),
      ),
    );
  }

  String getTitle(AppLocalizations localizations) {
    switch (type) {
      case LinkWidgetType.Website:
        return localizations.goToWebsite;
      case LinkWidgetType.Instagram:
        return localizations.goToInstagram;
      case LinkWidgetType.MoreInfo:
        return localizations.moreInfo;
    }
  }

  Color getTextColor() {
    switch (type) {
      case LinkWidgetType.Website:
        return const Color.fromRGBO(212, 90, 90, 1);
      case LinkWidgetType.Instagram:
        return const Color.fromRGBO(124, 217, 100, 1);
      case LinkWidgetType.MoreInfo:
        return const Color.fromRGBO(72, 103, 212, 1);
    }
  }

  Color getBackgroundColor() {
    switch (type) {
      case LinkWidgetType.Website:
        return const Color.fromRGBO(255, 178, 178, 1);
      case LinkWidgetType.Instagram:
        return const Color.fromRGBO(216, 255, 185, 1);
      case LinkWidgetType.MoreInfo:
        return const Color.fromRGBO(185, 196, 255, 1);
    }
  }
}
