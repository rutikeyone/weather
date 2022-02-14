import 'package:weather_app/data/api/model/current_weather/api_current_weather_data.dart';
import 'package:weather_app/domain/model/current_weather/coord.dart';
import 'package:weather_app/domain/model/current_weather/current_weather_data.dart';
import 'package:weather_app/domain/model/current_weather/main.dart';
import 'package:weather_app/domain/model/current_weather/weather.dart';
import 'package:weather_app/domain/model/current_weather/wind.dart';

class CurrentWeatherMapper {
  static CurrentWeatherData fromApi(ApiCurrentWeatherData data) {
    return CurrentWeatherData(
      name: data.name!,
      date: DateTime.fromMillisecondsSinceEpoch(data.dt!.toInt() * 1000),
      coord: Coord(lat: data.coord!.lat!, lon: data.coord!.lon!),
      weather: Weather(
        main: data.weather![0].main!,
        description: data.weather![0].description!,
        icon: data.weather![0].icon!,
      ),
      main: Main(
        temp: data.main!.temp!,
        feelsLike: data.main!.feelsLike!,
        tempMin: data.main!.tempMin!,
        tempMax: data.main!.tempMax!,
        pressure: data.main!.pressure!,
        humidity: data.main!.humidity!,
        seaLevel: data.main!.seaLevel!,
        grndLevel: data.main!.grndLevel!,
      ),
      visibility: data.visibility!,
      wind: Wind(
        deg: data.wind!.deg!,
        speed: data.wind!.speed!,
        gust: data.wind!.gust!,
      ),
    );
  }
}
