import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:privatewebsite/future_libs/descriptum_patronum/model/structs.dart';
import 'package:privatewebsite/future_libs/descriptum_patronum/widgets/bullet_point_list.dart';
import 'package:privatewebsite/future_libs/descriptum_patronum/widgets/described_thing.dart';
import 'package:privatewebsite/pages/projects/backend/model/structs.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:privatewebsite/router.dart';
import 'package:privatewebsite/shared/ui/base/page.dart';
import 'package:privatewebsite/shared/ui/widgets/link_button.dart';

class ProjectItem extends StatelessWidget {
  final ProjectContent projectContent;
  final ResponsiveState state;

  const ProjectItem(this.projectContent, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final localizations = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          projectContent.title,
          style: theme.textTheme.headlineMedium,
        ),
        const SizedBox(height: 20),
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 450,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    (projectContent.shortDescription.descriptions.firstWhere((element) => element is PlainTextDescription) as PlainTextDescription)
                        .text,
                    style: theme.textTheme.bodyMedium,
                  ),
                  BulletPointList(
                    bulletPoints: projectContent.shortDescription.getAbstraction<BulletPoint>(),
                    container: BulletContainer.surface,
                  ),
                  const SizedBox(height: 42),
                ],
              ),
            ),
            buildInfoBox(localizations),
            Row(
              children: [
                if (projectContent.webUrl != null) LinkWidget(LinkWidgetType.Website, url: projectContent.webUrl!),
                if (projectContent.instagramName != null) LinkWidget(LinkWidgetType.Instagram, instagramTag: projectContent.instagramName!),
                LinkWidget(LinkWidgetType.MoreInfo, route: ProjectDetail(projectId: projectContent.id)),
              ],
            )
          ],
        ),
        const SizedBox(height: 20),
        const ColoredBox(
          color: Colors.grey,
          child: SizedBox(
            height: 1,
            width: 1000,
          ),
        ),
        const SizedBox(height: 42),
      ],
    );
  }

  Widget buildInfoBox(AppLocalizations localizations) {
    return Container(
      width: 280,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 42),
      decoration: ShapeDecoration(
        color: const Color.fromRGBO(255, 237, 188, 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DescribedThingWidget(
            description: DescribedThing(
              descriptions: [
                AdditionalInfo(DateFormat.yMMMEd().format(projectContent.projectStart)),
              ],
              title: localizations.start,
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: projectContent.descriptions.length,
            itemBuilder: (context, index) {
              final description = projectContent.descriptions[index];
              return DescribedThingWidget(description: description);
            },
          ),
        ],
      ),
    );
  }
}
