class GetCurrentWeatherBody {
  final String apiKey = "82630901bb3f9ed64d98d0a72e3ad275";
  final double latitude;
  final double longitude;
  final String units;

  GetCurrentWeatherBody({
    required this.latitude,
    required this.longitude,
    required this.units,
  });
}
