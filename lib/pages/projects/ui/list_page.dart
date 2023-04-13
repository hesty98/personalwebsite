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

class ProjectsPage extends ResponsivePage {
  const ProjectsPage({super.key});

  @override
  Widget buildBody(BuildContext context, SizingInformation sizingInformation, ResponsiveState state) {
    return FutureBuilder<List<ProjectContent>>(
      future: ImplProjectsPort().getAllProjects(),
      builder: (context, snapshot) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data?.length ?? 0,
          itemBuilder: (context, index) {
            return ProjectItem(snapshot.data![index], state);
          },
        );
      },
    );
  }


}
