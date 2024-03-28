import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/navigation/routes/AppRouter.dart';
import 'dart:io' show Platform;

import '../core/preferences/PreferencesHelper.dart';
import '../core/preferences/Prefs.dart';
import '../core/preferences/constants.dart'; //at the top

@module
abstract class AppModule {
  @preResolve
  Future<Dio> dio() async => Dio()
    // ..options.headers['X-Language'] = languageCode
    ..options.headers['Accept'] = "application/json"
    ..options.headers['Content-Type'] = "application/json"
    ..options.connectTimeout =
        const Duration(milliseconds: Duration.millisecondsPerMinute)
    ..options.receiveTimeout =
        const Duration(milliseconds: Duration.millisecondsPerMinute)
    ..options.validateStatus = (status) {
      return status! <= 500;
    };

  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  PreferencesHelper getPreferencesHelper(SharedPreferences prefs) =>
      PreferencesHelper(prefs);

  @Singleton()
  @Named("currentPlatform")
  String get currentPlatform => Platform.isAndroid ? "android" : "iphone";

  @Singleton()
  AppRouter get appRouter => AppRouter();
}
