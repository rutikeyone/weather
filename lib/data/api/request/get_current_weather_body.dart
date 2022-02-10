class GetCurrentWeatherBody {
  final String apiKey = "82630901bb3f9ed64d98d0a72e3ad275";
  final String city;
  final String country;
  final String units;

  GetCurrentWeatherBody({
    required this.city,
    required this.country,
    required this.units,
  });
}
