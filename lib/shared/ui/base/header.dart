import 'package:auto_route/auto_route.dart';
import 'package:auto_route/src/route/page_route_info.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:privatewebsite/router.dart';
import 'package:privatewebsite/service_locator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:privatewebsite/shared/ui/base/page.dart';
import 'package:responsive_builder/responsive_builder.dart';

class Header extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        final size = sizingInformation.screenSize;

        late ResponsiveState state;
        if (size.width < ResponsivePage.maxWidthSmall) state = ResponsiveState.Small;
        if (size.width >= ResponsivePage.maxWidthSmall && size.width < ResponsivePage.maxWidthMedium) state = ResponsiveState.Medium;
        if (size.width >= ResponsivePage.maxWidthMedium) state = ResponsiveState.Large;

        return Center(
          child: SizedBox(
            width: size.width * 0.8,
            height: state == ResponsiveState.Large ? 100 : 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (state == ResponsiveState.Small)
                  InkWell(
                    child: Icon(Icons.menu),
                  ),
                Center(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(state == ResponsiveState.Large ? 10 : 7),
                        decoration: ShapeDecoration(
                          shape: CircleBorder(
                            side: BorderSide(
                              width: 1,
                              color: theme.colorScheme.onSurface,
                            ),
                          ),
                        ),
                        child: Text(
                          "Lh",
                          style: TextStyle(color: theme.colorScheme.onSurface, fontSize: state == ResponsiveState.Large ? 28 : 20),
                        ),
                      ),
                    ],
                  ),
                ),
                if (state != ResponsiveState.Small)
                  ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: List.generate(
                      AppBarPage.values.length,
                      (index) {
                        return AppBarLink(page: AppBarPage.values[index], state: state);
                      },
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}

enum AppBarPage {
  Home,
  Projects,
  Career,
  Interests,
  Manifest;

  String getTitle(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    switch (this) {
      case AppBarPage.Home:
        return localizations.page_home_title;
      case AppBarPage.Projects:
        return localizations.page_projects_title;
      case AppBarPage.Career:
        return localizations.page_career_title;
      case AppBarPage.Interests:
        return localizations.page_interests_title;
      case AppBarPage.Manifest:
        return localizations.page_manifest_title;
    }
  }
}

class AppBarLink extends HookWidget {
  final AppBarPage page;
  final ResponsiveState state;

  const AppBarLink({super.key, required this.page, required this.state});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hovered = useState(false);

    final router = locator<AppRouter>();
    bool selected = false;
    if (page.name == router.current.name) {
      selected = true;
    }
    double horizontalMargin = state == ResponsiveState.Large ? 15 : 5;
    return InkWell(
      onHover: (value) {
        hovered.value = value;
      },
      onTap: () {
        router.push(routeForPage());
      },
      child: Container(
        margin: EdgeInsets.only(left: horizontalMargin, right: horizontalMargin, top: 10),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Text(
              page.getTitle(context),
              style: TextStyle(
                fontSize: state == ResponsiveState.Large ? 28 : 18,
                fontWeight: (hovered.value || selected) ? FontWeight.bold : FontWeight.w300,
                color: selected ? theme.colorScheme.onSurface : const Color.fromRGBO(136, 136, 136, 1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PageRouteInfo routeForPage() {
    switch (page) {
      case AppBarPage.Home:
        return const Home();
      case AppBarPage.Projects:
        return const Projects();
      case AppBarPage.Career:
        return const Career();
      case AppBarPage.Interests:
        return const Interests();
      case AppBarPage.Manifest:
        return const Manifest();
    }
  }
}
