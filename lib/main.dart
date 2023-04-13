import 'package:flutter/material.dart';
import 'package:privatewebsite/router.dart';
import 'package:privatewebsite/service_locator.dart';
import 'package:privatewebsite/theme.dart';
import 'package:privatewebsite/theme_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(LifeApp());
}

class LifeApp extends StatefulWidget {
  @override
  State<LifeApp> createState() => _LifeAppState();
}

class _LifeAppState extends State<LifeApp> {
  @override
  void initState() {
    themeManager.addListener(_themeListener);
    super.initState();
  }

  _themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    themeManager.removeListener(_themeListener);
  }

  //todo: don't include AppRoute in my GetIt instance, instead make a factory (singleton) of it
  //     because currently this is the reason our app jumps to home once we hot reload
  final _appRouter = locator<AppRouter>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Linus Hestermeyer",
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeManager.isDarkMode() ? ThemeMode.dark : ThemeMode.light,
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      routeInformationProvider: _appRouter.routeInfoProvider(),

    );
  }
}
