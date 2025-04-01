import 'dart:convert';
import 'package:http/http.dart' as http;

class ImageService {
  static const String _unsplashApiKey = "yRTyhIc3e1PSxUTKLnD0tFJ6H9VmhscDrZYnGXks6Yg";
  static const String _baseUrl = "https://api.unsplash.com/search/photos";

  Future<String?> fetchCityImage(String cityName) async {
    final response = await http.get(
      Uri.parse("$_baseUrl?query=$cityName&client_id=$_unsplashApiKey"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['results'].isNotEmpty) {
        return data['results'][0]['urls']['regular'];
      }
    }
    return null; 
  }
}
