import 'package:injectable/injectable.dart';
import 'PreferencesHelper.dart';
import 'constants.dart';

@injectable
class Prefs {
  final PreferencesHelper preferencesHelper;

  Prefs(this.preferencesHelper);

  // Future<List<String>> get savedPlaces => preferencesHelper.getStringList('saved');

  // Future setSavedPlaces(List<String> value) =>
  //     preferencesHelper.setStringList('saved', value);
  
  Future<String> get savedPlaces => preferencesHelper.getString('saved');

  Future setSavedPlaces(String value) =>
      preferencesHelper.setString('saved', value);

  Future<void> clear() async {
    await Future.wait(<Future>[
      preferencesHelper.prefs.remove('saved'),
      // preferencesHelper.prefs.remove(token),
      // preferencesHelper.prefs.remove(isLogin),
      // preferencesHelper.prefs.remove(userOrder),
    ]);
  }
}
