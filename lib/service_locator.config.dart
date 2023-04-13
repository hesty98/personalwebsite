// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:stacked_services/stacked_services.dart' as _i4;

import 'router.dart' as _i3;
import 'service_locator.dart' as _i5;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final thirdPartyModule = _$ThirdPartyModule();
  gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
  gh.lazySingleton<_i4.BottomSheetService>(
      () => thirdPartyModule.bottomSheetService);
  gh.lazySingleton<_i4.DialogService>(() => thirdPartyModule.dialogService);
  gh.lazySingleton<_i4.NavigationService>(
      () => thirdPartyModule.navigationService);
  return getIt;
}

class _$ThirdPartyModule extends _i5.ThirdPartyModule {
  @override
  _i4.NavigationService get navigationService => _i4.NavigationService();
  @override
  _i4.DialogService get dialogService => _i4.DialogService();
  @override
  _i4.BottomSheetService get bottomSheetService => _i4.BottomSheetService();
}
