import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_api_service.dart';
import '../services/image_service.dart';

class WeatherProvider with ChangeNotifier {
  WeatherModel? _weather;
  String? _cityImage;
  bool _isLoading = false;
  ThemeMode _themeMode = ThemeMode.light;

  WeatherModel? get weather => _weather;
  String? get cityImage => _cityImage;
  bool get isLoading => _isLoading;
  ThemeMode get themeMode => _themeMode;


  final WeatherApiService _weatherApiService = WeatherApiService();
  final ImageService _imageService = ImageService();

  Future<void> fetchWeather(String city) async {
    _isLoading = true;
      _cityImage = null;  
    notifyListeners();

    final weatherData = await _weatherApiService.fetchWeather(city);
    final cityImageData = await _imageService.fetchCityImage(city);

    if (weatherData != null) {
      _weather = weatherData;
      _cityImage = cityImageData;
    }

    _isLoading = false;
    notifyListeners();
  }
  void clearImage() {
    _cityImage = null;
    _weather = null;
    notifyListeners();
  }
  void toggleTheme() {
    _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

}
