import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/domain/model/settings.dart';
import 'package:weather_app/domain/repository/settings_repository.dart';

class SettingsDataRepository extends SettingsRepository {
  SharedPreferences sharedPreferences;

  SettingsDataRepository({required this.sharedPreferences});

  @override
  Settings getSettings() {
    bool _isImperialUnits =
        sharedPreferences.containsKey(Settings.isImperialSettingsKey)
            ? sharedPreferences.getBool(Settings.isImperialSettingsKey)!
            : false;
    return Settings(
      isImperialUnits: _isImperialUnits,
      units: _isImperialUnits ? "imperial" : "metric",
    );
  }

  void changeUnits(bool isImperialUnits) async {
    await sharedPreferences.setBool(
        Settings.isImperialSettingsKey, !isImperialUnits);
  }
}
