import 'package:flutter/material.dart';
import 'package:privatewebsite/shared/ui/base/page.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ImpressumPage extends ResponsivePage {
  @override
  Widget buildBody(BuildContext context, SizingInformation sizingInformation, ResponsiveState state) {
    final l = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          l.impressum,
          textAlign: TextAlign.center,
          style: theme.textTheme.headlineSmall,
        ),
        HeaderAndContent(header: l.impr_5_tmg_header, content: l.impr_5_tmg_content),
        HeaderAndContent(header: l.impr_kontakt_header, content: l.impr_kontakt_content),
        Text(l.impr_haftung_disclaimer,style: theme.textTheme.bodyLarge,),
        HeaderAndContent(header: l.impr_haftung_p_1_header, content: l.impr_haftung_p_1_content),
        HeaderAndContent(header: l.impr_haftung_p_2_header, content: l.impr_haftung_p_2_content),
        HeaderAndContent(header: l.impr_haftung_p_3_header, content: l.impr_haftung_p_3_content),
      ],
    );
  }
}

class HeaderAndContent extends StatelessWidget {
  final String header;
  final String content;
  final double padding;

  const HeaderAndContent({super.key, required this.header, required this.content, this.padding = 30});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(bottom: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            header,
            style: theme.textTheme.bodyMedium,
          ),
          Text(
            content,
            style: theme.textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
