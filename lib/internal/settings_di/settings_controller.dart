import 'package:weather_app/data/repository/settings_data_repository.dart';
import 'package:weather_app/domain/model/settings.dart';

import '../locator.dart';

class SettingsController {
  Settings getSettings() {
    return getIt.get<SettingsDataRepository>().getSettings();
  }

  void changeUnits({required bool isImperialUnits}) {
    return getIt.get<SettingsDataRepository>().changeUnits(isImperialUnits);
  }
}
