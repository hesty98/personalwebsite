import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:privatewebsite/pages/career/ui/page.dart';
import 'package:privatewebsite/pages/home/ui/page.dart';
import 'package:privatewebsite/pages/interests/ui/page.dart';
import 'package:privatewebsite/pages/legal/ui/impressum.dart';
import 'package:privatewebsite/pages/legal/ui/privacy.dart';
import 'package:privatewebsite/pages/manifest/ui/page.dart';
import 'package:privatewebsite/pages/projects/ui/detail_page.dart';
import 'package:privatewebsite/pages/projects/ui/list_page.dart';

part 'router.gr.dart';

//Todo: refector names - currently they are the same as in the PageEnum, but one cant see that its a route while reading the code

@lazySingleton
@CustomAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true, name: "Home"),
    AutoRoute(page: ProjectsPage, name: "Projects", path: '/projects'),
    AutoRoute(page: ProjectDetailPage, name: "ProjectDetail", path: '/projects/:projectId'),
    AutoRoute(page: CareerPage, name: "Career"),
    AutoRoute(page: InterestPage, name: "Interests"),
    AutoRoute(page: ManifestPage, name: "Manifest"),
    AutoRoute(page: ImpressumPage, name: "Impressum"),
    AutoRoute(page: DataPrivacyPage, name: "PrivacyPolicyPage"),
    // AutoRoute(page: ManifestPage, name: "Manifest"),
    // AutoRoute(page: ManifestPage, name: "Manifest"),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter() : super();
}
