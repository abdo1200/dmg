// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:clean_arc/features/home/presentation/home_page/bloc/home_cubit.dart'
    as _i5;
import 'package:clean_arc/src/app/bloc/app_bloc.dart' as _i9;
import 'package:clean_arc/src/core/navigation/routes/AppRouter.dart' as _i3;
import 'package:clean_arc/src/core/preferences/PreferencesHelper.dart' as _i7;
import 'package:clean_arc/src/core/preferences/Prefs.dart' as _i8;
import 'package:clean_arc/src/di/AppModule.dart' as _i10;
import 'package:dio/dio.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.singleton<_i3.AppRouter>(appModule.appRouter);
    await gh.factoryAsync<_i4.Dio>(
      () => appModule.dio(),
      preResolve: true,
    );
    gh.factory<_i5.HomeCubit>(() => _i5.HomeCubit());
    await gh.factoryAsync<_i6.SharedPreferences>(
      () => appModule.prefs,
      preResolve: true,
    );
    gh.singleton<String>(
      appModule.currentPlatform,
      instanceName: 'currentPlatform',
    );
    gh.factory<_i7.PreferencesHelper>(
        () => appModule.getPreferencesHelper(gh<_i6.SharedPreferences>()));
    gh.factory<_i8.Prefs>(() => _i8.Prefs(gh<_i7.PreferencesHelper>()));
    gh.factory<_i9.AppBloc>(() => _i9.AppBloc(prefs: gh<_i8.Prefs>()));
    return this;
  }
}

class _$AppModule extends _i10.AppModule {}
