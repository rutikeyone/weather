import 'package:weather_app/domain/model/settings.dart';

abstract class SettingsRepository {
  Settings getSettings();
  void changeUnits(bool isImperialUnits);
}
