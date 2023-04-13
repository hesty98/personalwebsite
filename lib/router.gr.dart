// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    Home.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: HomePage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    Projects.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const ProjectsPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProjectDetail.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProjectDetailArgs>(
          orElse: () =>
              ProjectDetailArgs(projectId: pathParams.getString('projectId')));
      return CustomPage<dynamic>(
        routeData: routeData,
        child: ProjectDetailPage(
          args.projectId,
          key: args.key,
        ),
        opaque: true,
        barrierDismissible: false,
      );
    },
    Career.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: const CareerPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    Interests.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: InterestPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    Manifest.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: ManifestPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    Impressum.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: ImpressumPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    PrivacyPolicyPage.name: (routeData) {
      return CustomPage<dynamic>(
        routeData: routeData,
        child: DataPrivacyPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          Home.name,
          path: '/',
        ),
        RouteConfig(
          Projects.name,
          path: '/projects',
        ),
        RouteConfig(
          ProjectDetail.name,
          path: '/projects/:projectId',
        ),
        RouteConfig(
          Career.name,
          path: '/career-page',
        ),
        RouteConfig(
          Interests.name,
          path: '/interest-page',
        ),
        RouteConfig(
          Manifest.name,
          path: '/manifest-page',
        ),
        RouteConfig(
          Impressum.name,
          path: '/impressum-page',
        ),
        RouteConfig(
          PrivacyPolicyPage.name,
          path: '/data-privacy-page',
        ),
      ];
}

/// generated route for
/// [HomePage]
class Home extends PageRouteInfo<void> {
  const Home()
      : super(
          Home.name,
          path: '/',
        );

  static const String name = 'Home';
}

/// generated route for
/// [ProjectsPage]
class Projects extends PageRouteInfo<void> {
  const Projects()
      : super(
          Projects.name,
          path: '/projects',
        );

  static const String name = 'Projects';
}

/// generated route for
/// [ProjectDetailPage]
class ProjectDetail extends PageRouteInfo<ProjectDetailArgs> {
  ProjectDetail({
    required String projectId,
    Key? key,
  }) : super(
          ProjectDetail.name,
          path: '/projects/:projectId',
          args: ProjectDetailArgs(
            projectId: projectId,
            key: key,
          ),
          rawPathParams: {'projectId': projectId},
        );

  static const String name = 'ProjectDetail';
}

class ProjectDetailArgs {
  const ProjectDetailArgs({
    required this.projectId,
    this.key,
  });

  final String projectId;

  final Key? key;

  @override
  String toString() {
    return 'ProjectDetailArgs{projectId: $projectId, key: $key}';
  }
}

/// generated route for
/// [CareerPage]
class Career extends PageRouteInfo<void> {
  const Career()
      : super(
          Career.name,
          path: '/career-page',
        );

  static const String name = 'Career';
}

/// generated route for
/// [InterestPage]
class Interests extends PageRouteInfo<void> {
  const Interests()
      : super(
          Interests.name,
          path: '/interest-page',
        );

  static const String name = 'Interests';
}

/// generated route for
/// [ManifestPage]
class Manifest extends PageRouteInfo<void> {
  const Manifest()
      : super(
          Manifest.name,
          path: '/manifest-page',
        );

  static const String name = 'Manifest';
}

/// generated route for
/// [ImpressumPage]
class Impressum extends PageRouteInfo<void> {
  const Impressum()
      : super(
          Impressum.name,
          path: '/impressum-page',
        );

  static const String name = 'Impressum';
}

/// generated route for
/// [DataPrivacyPage]
class PrivacyPolicyPage extends PageRouteInfo<void> {
  const PrivacyPolicyPage()
      : super(
          PrivacyPolicyPage.name,
          path: '/data-privacy-page',
        );

  static const String name = 'PrivacyPolicyPage';
}
