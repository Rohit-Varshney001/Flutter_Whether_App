class WeatherModel {
  final String cityName;
  final double temperature;
  final int humidity;
  final String condition;

  WeatherModel({
    required this.cityName,
    required this.temperature,
    required this.humidity,
    required this.condition,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      humidity: json['main']['humidity'],
      condition: json['weather'][0]['description'],
    );
  }
}
