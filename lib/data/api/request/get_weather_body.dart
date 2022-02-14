class GetWeatherBody {
  final String apiKey = "82630901bb3f9ed64d98d0a72e3ad275";
  final double latitude;
  final double longitude;
  final String units;

  GetWeatherBody({
    required this.latitude,
    required this.longitude,
    required this.units,
  });
}
