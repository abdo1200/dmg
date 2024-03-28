import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// ignore: unused_import
import 'injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();
