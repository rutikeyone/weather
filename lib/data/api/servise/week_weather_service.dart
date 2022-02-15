import 'dart:convert';

import 'package:weather_app/data/api/model/week_weather/api_week_weather_data.dart';
import 'package:weather_app/data/api/request/get_weather_body.dart';
import 'package:http/http.dart' as http;

class WeekWeatherService {
  Future<ApiWeekWeatherData> getWeeksWeatherData(GetWeatherBody body) async {
    final _BASE_URL =
        "https://api.openweathermap.org/data/2.5/onecall?lat=${body.latitude}&lon=${body.longitude}&exclude=alerts&appid=${body.apiKey}&units=${body.units}";
    final responce = await http.get(Uri.parse(_BASE_URL));
    final data = jsonDecode(responce.body);
    ApiWeekWeatherData _weekWeatherData = ApiWeekWeatherData.empty();

    if (responce.statusCode == 200) {
      _weekWeatherData = ApiWeekWeatherData.fromJson(data);
    }

    return _weekWeatherData;
  }
}
