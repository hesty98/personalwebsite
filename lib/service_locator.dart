import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:privatewebsite/service_locator.config.dart';
import 'package:stacked_services/stacked_services.dart';

GetIt locator = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future configureDependencies() async {
  $initGetIt(locator);
  // locator.registerSingleton(db);
}

@module
abstract class ThirdPartyModule {
  @lazySingleton
  NavigationService get navigationService;

  @lazySingleton
  DialogService get dialogService;

  @lazySingleton
  BottomSheetService get bottomSheetService;
}
