import 'package:clean_arc/resource/styles/app_colors.dart';
import 'package:clean_arc/resource/styles/app_themes.dart';

import 'package:clean_arc/src/app/bloc/app_bloc.dart';
import 'package:clean_arc/src/core/helpers/location_helper.dart';
import 'package:clean_arc/src/core/local/locale_constants.dart';
import 'package:clean_arc/src/core/navigation/routes/AppRouter.dart';
import 'package:clean_arc/src/core/preferences/Prefs.dart';
import 'package:clean_arc/src/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_it/get_it.dart';

import 'src/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // HttpOverrides.global = MyHttpOverrides();
  // await Firebase.initializeApp();
  // await FlutterDownloader.initialize(
  //     debug:
  //         true, // optional: set to false to disable printing logs to console (default: true)
  //     ignoreSsl:
  //         true // option: set to false to disable working with http links (default: false)
  //     );

  await configureDependencies();
  // FirebaseNotificationUserClass.initFirebase();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.white,
  ));

  await LocationHelper.getCurrentLocation();


  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AppBloc>(
          create: (context) => AppBloc(
                prefs: getIt(),
                // modeThem: theme.isEmpty ? "light" : theme
              )),
    ],
    child: Builder(builder: (context) {
      return MyApp();
    }),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  final _appRouter = GetIt.instance.get<AppRouter>();

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppBloc? bloc;
  @override
  void initState() {
    super.initState();
    // AppColors.of(context);
    bloc = context.read<AppBloc>();
    bloc?.add(InitEvent());
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) =>
          BlocBuilder<AppBloc, AppState>(
        buildWhen: (previous, current) => previous.position != null,
        builder: (context, state) {
          AppColors.of(context);
          // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
          //   statusBarColor: AppColors.current.witheColor, // status bar color
          // ));
          if (state is AppInitial) {
            return MaterialApp.router(
              routerConfig: widget._appRouter.config(),
              localeResolutionCallback:
                  (Locale? locale, Iterable<Locale> supportedLocales) =>
                      supportedLocales.contains(locale)
                          ? locale
                          : const Locale(LocaleConstants.defaultLocale),
              locale:
                  Locale(state.languageCode ?? LocaleConstants.defaultLocale),
              supportedLocales: S.delegate.supportedLocales,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: ThemeMode.light,
              // bloc!.modeThem == "dark" ? ThemeMode.dark : ThemeMode.light,
              color: Colors.white,
              title: 'golden_host',
              //home: const Scaffold(body: Text('xxxx')),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
