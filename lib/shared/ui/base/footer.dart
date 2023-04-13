import 'package:flutter/material.dart';
import 'package:privatewebsite/router.dart';
import 'package:privatewebsite/service_locator.dart';
import 'package:privatewebsite/shared/ui/base/page.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return ResponsiveBuilder(
      builder: (BuildContext context, SizingInformation sizingInformation) {
        final size = sizingInformation.screenSize;

        late ResponsiveState state;
        if (size.width < ResponsivePage.maxWidthSmall) state = ResponsiveState.Small;
        if (size.width >= ResponsivePage.maxWidthSmall && size.width < ResponsivePage.maxWidthMedium) state = ResponsiveState.Medium;
        if (size.width >= ResponsivePage.maxWidthMedium) state = ResponsiveState.Large;

        return Container(
          width: size.width,
          height: 42,
          margin: const EdgeInsets.only(top: 200),
          color: Color.fromRGBO(169, 241, 168, 1),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  locator<AppRouter>().push(Impressum());
                },
                child: Text(localizations.impressum, style: theme.textTheme.labelLarge),
              ),
              const SizedBox(width: 50),
              TextButton(
                onPressed: () {
                  locator<AppRouter>().push(PrivacyPolicyPage());
                },
                child: Text(localizations.datenschutz, style: theme.textTheme.labelLarge),
              ),
            ],
          ),
        );
      },
    );
  }
}
