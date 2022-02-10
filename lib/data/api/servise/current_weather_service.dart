import 'dart:convert';

import 'package:weather_app/data/api/model/current_weather/api_current_weather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/data/api/request/get_current_weather_body.dart';

class CurrentWeatherService {
  Future<ApiCurrentWeatherData> getCurrentWeatherData(
      GetCurrentWeatherBody body) async {
    final String _BASE_URL =
        "https://api.openweathermap.org/data/2.5/weather?q=${body.city}&appid=${body.apiKey}&units=${body.units}";
    final responce = await http.get(Uri.parse(_BASE_URL));
    final data = jsonDecode(responce.body);
    ApiCurrentWeatherData currentWeatherData = ApiCurrentWeatherData();
    if (responce.statusCode == 200) {
      currentWeatherData = ApiCurrentWeatherData.fromJson(data);
    }

    return currentWeatherData;
  }
}
