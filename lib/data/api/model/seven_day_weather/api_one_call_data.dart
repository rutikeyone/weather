import 'api_current.dart';
import 'api_daily.dart';
import 'api_hourly.dart';
import 'api_minutely.dart';
import 'api_weather.dart';

class ApiOneCallData {
  ApiOneCallData.empty();

  ApiOneCallData({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.minutely,
    required this.hourly,
    required this.daily,
  });
  late final int lat;
  late final int lon;
  late final String timezone;
  late final int timezoneOffset;
  late final ApiCurrent current;
  late final List<ApiMinutely> minutely;
  late final List<ApiHourly> hourly;
  late final List<ApiDaily> daily;

  ApiOneCallData.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    current = ApiCurrent.fromJson(json['current']);
    minutely = List.from(json['minutely'])
        .map((e) => ApiMinutely.fromJson(e))
        .toList();
    hourly =
        List.from(json['hourly']).map((e) => ApiHourly.fromJson(e)).toList();
    daily = List.from(json['daily']).map((e) => ApiDaily.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lat'] = lat;
    _data['lon'] = lon;
    _data['timezone'] = timezone;
    _data['timezone_offset'] = timezoneOffset;
    _data['current'] = current.toJson();
    _data['minutely'] = minutely.map((e) => e.toJson()).toList();
    _data['hourly'] = hourly.map((e) => e.toJson()).toList();
    _data['daily'] = daily.map((e) => e.toJson()).toList();
    return _data;
  }
}
