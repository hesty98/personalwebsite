import 'package:flutter/material.dart';
import 'package:privatewebsite/pages/career/ui/career_widget.dart';
import 'package:privatewebsite/pages/career/ui/knowledge_widget.dart';
import 'package:privatewebsite/shared/ui/base/page.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CareerPage extends ResponsivePage {
  const CareerPage({super.key});

  @override
  Widget buildBody(BuildContext context, SizingInformation sizingInformation, ResponsiveState state) {
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          localizations.career_info,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium,
        ),
        CareerWidget(sizingInformation, state),
        KnowledgeWidget(sizingInformation, state),
      ],
    );
  }
}
