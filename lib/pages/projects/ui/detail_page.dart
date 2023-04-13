import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:intl/intl.dart';
import 'package:privatewebsite/future_libs/descriptum_patronum/model/structs.dart';
import 'package:privatewebsite/pages/projects/backend/model/structs.dart';
import 'package:privatewebsite/pages/projects/backend/prim_port.dart';
import 'package:privatewebsite/pages/projects/ui/widgets/project_item.dart';
import 'package:privatewebsite/router.dart';
import 'package:privatewebsite/shared/ui/base/page.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProjectDetailPage extends ResponsivePage {
  final String projectId;

  const ProjectDetailPage(@pathParam this.projectId, {super.key});

  @override
  Widget buildBody(BuildContext context, SizingInformation sizingInformation, ResponsiveState state) {
    final theme = Theme.of(context);
    return FutureBuilder<ProjectContent>(
      future: ImplProjectsPort().getProjectById(projectId),
      builder: (context, snapshot) {
        //todo: errorhandling
        if (snapshot.data == null) {
          return const SizedBox();
        }
        return Column(
          children: [
            ProjectItem(snapshot.data!, state),
            Text(snapshot.data!.longDescription?.text ??"", style: theme.textTheme.bodyMedium,)
          ],
        );
      },
    );
  }

}
