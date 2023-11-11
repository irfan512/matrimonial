class City {
  final String cityId;
  final String cityName;
  final String isActive;
  final String countryName;
  final String stateName;
  final String stateid;


  City({
    required this.cityId,
    required this.stateid,
    required this.cityName,
    required this.isActive,
    required this.countryName,
    required this.stateName,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      stateid: json['state_id']??'',
      cityId: json['city_id'] ?? '',
      cityName: json['city_name'] ?? '',
      isActive: json['is_active'] ?? '',
      countryName: json['country_name'] ?? '',
      stateName: json['state_name'] ?? '',
    );
  }
}