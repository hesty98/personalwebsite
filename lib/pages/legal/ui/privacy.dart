import 'package:flutter/material.dart';
import 'package:privatewebsite/shared/ui/base/page.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DataPrivacyPage extends ResponsivePage {
  @override
  Widget buildBody(BuildContext context, SizingInformation sizingInformation, ResponsiveState state) {
    final l = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l.datenschutz,
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall,
        ),
        Text(l.privacy_policy_disclaimer),
      ],
    );
  }
}
