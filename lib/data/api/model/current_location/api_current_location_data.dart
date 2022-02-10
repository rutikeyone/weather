class ApiCurrentLocationData {
  double latitude;
  double longitude;
  String country;
  String city;

  ApiCurrentLocationData(
      {required this.latitude,
      required this.longitude,
      required this.city,
      required this.country});
}
