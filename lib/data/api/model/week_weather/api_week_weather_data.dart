import 'api_current.dart';
import 'api_daily.dart';
import 'api_hourly.dart';

class ApiWeekWeatherData {
  late final num? lat;
  late final num? lon;
  late final String? timezone;
  late final num? timezoneOffset;
  late final ApiCurrent? current;
  late final List<ApiHourly>? hourly;
  late final List<ApiDaily>? daily;

  ApiWeekWeatherData.empty();

  ApiWeekWeatherData({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.timezoneOffset,
    required this.current,
    required this.hourly,
    required this.daily,
  });

  ApiWeekWeatherData.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
    timezone = json['timezone'];
    timezoneOffset = json['timezone_offset'];
    current = ApiCurrent.fromJson(json['current']);
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
    _data['current'] = current!.toJson();
    _data['hourly'] = hourly!.map((e) => e.toJson()).toList();
    _data['daily'] = daily!.map((e) => e.toJson()).toList();
    return _data;
  }
}
