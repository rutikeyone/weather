import 'package:weather_app/data/api/model/week_weather/api_week_weather_data.dart';
import 'package:weather_app/domain/model/week_weather/current.dart';
import 'package:weather_app/domain/model/week_weather/daily.dart';
import 'package:weather_app/domain/model/week_weather/feels_like.dart';
import 'package:weather_app/domain/model/week_weather/hourly.dart';
import 'package:weather_app/domain/model/week_weather/week_weather_data.dart';
import 'package:weather_app/domain/model/week_weather/temp.dart';
import 'package:weather_app/domain/model/week_weather/weather.dart';

class WeekWeatherMapper {
  static WeekWeatherData fromApi(ApiWeekWeatherData data) {
    return WeekWeatherData(
        lat: data.lat!,
        lon: data.lon!,
        timezone: data.timezone!,
        timezoneOffset: data.timezoneOffset!,
        current: Current(
          dt: data.current!.dt!,
          sunrise: data.current!.sunrise!,
          sunset: data.current!.sunset!,
          temp: data.current!.temp!,
          feelsLike: data.current!.feelsLike!,
          pressure: data.current!.pressure!,
          humidity: data.current!.humidity!,
          dewPoint: data.current!.dewPoint!,
          uvi: data.current!.uvi!,
          clouds: data.current!.clouds!,
          visibility: data.current!.visibility!,
          windSpeed: data.current!.windSpeed!,
          windDeg: data.current!.windDeg!,
          windGust: data.current!.windGust!,
          weather: data.current!.weather!
              .map(
                (item) => Weather(
                    id: item.id!,
                    main: item.main!,
                    description: item.description!,
                    icon: item.icon!),
              )
              .toList(),
        ),
        hourlies: data.hourly!.length >= 24
            ? data.hourly!
                .take(24)
                .map(
                  (item) => Hourly(
                      hour: (DateTime.fromMillisecondsSinceEpoch(
                              item.dt!.toInt() * 1000))
                          .hour,
                      temp: item.temp!,
                      feelsLike: item.feelsLike!,
                      pressure: item.pressure!,
                      humidity: item.humidity!,
                      dewPoint: item.dewPoint!,
                      uvi: item.uvi!,
                      clouds: item.clouds!,
                      visibility: item.visibility!,
                      weather: Weather(
                          id: item.weather![0].id!,
                          main: item.weather![0].main!,
                          description: item.weather![0].description!,
                          icon: item.weather![0].icon!),
                      windDeg: item.windDeg!,
                      windSpeed: item.windSpeed!,
                      windGust: item.windGust!,
                      pop: item.pop!),
                )
                .toList()
            : data.hourly!
                .map((item) => Hourly(
                    hour: DateTime.fromMillisecondsSinceEpoch(
                            item.dt!.toInt() * 1000)
                        .hour,
                    temp: item.temp!,
                    feelsLike: item.feelsLike!,
                    pressure: item.pressure!,
                    humidity: item.humidity!,
                    dewPoint: item.dewPoint!,
                    uvi: item.uvi!,
                    clouds: item.clouds!,
                    visibility: item.visibility!,
                    weather: Weather(
                        id: item.weather![0].id!,
                        main: item.weather![0].main!,
                        description: item.weather![0].description!,
                        icon: item.weather![0].icon!),
                    windDeg: item.windDeg!,
                    windSpeed: item.windSpeed!,
                    windGust: item.windGust!,
                    pop: item.pop!))
                .toList(),
        dailies: data.daily!
            .map(
              (item) => Daily(
                dt: item.dt!,
                sunrise: item.sunrise!,
                sunset: item.sunset!,
                moonrise: item.moonrise!,
                moonset: item.moonset!,
                moonPhase: item.moonPhase!,
                temp: Temp(
                    day: item.temp!.day!,
                    min: item.temp!.min!,
                    max: item.temp!.max!,
                    night: item.temp!.night!,
                    morn: item.temp!.morn!,
                    eve: item.temp!.eve!),
                feelsLike: FeelsLike(
                  day: item.feelsLike!.day!,
                  night: item.feelsLike!.night!,
                  eve: item.feelsLike!.eve!,
                  morn: item.feelsLike!.morn!,
                ),
                pressure: item.pressure!,
                humidity: item.humidity!,
                dewPoint: item.dewPoint!,
                windSpeed: item.windSpeed!,
                windDeg: item.windDeg!,
                windGust: item.windGust!,
                weather: item.weather!
                    .map(
                      (item) => Weather(
                          id: item.id!,
                          main: item.main!,
                          description: item.description!,
                          icon: item.icon!),
                    )
                    .toList(),
                clouds: item.clouds!,
                pop: item.pop!,
                uvi: item.uvi!,
              ),
            )
            .toList());
  }
}
