import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class WeatherDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Weather Details")),
      body: weatherProvider.isLoading
          ? Center(child: CircularProgressIndicator())
          : weatherProvider.weather == null
              ? Center(child: Text("No data available"))
              : Stack(
                  children: [
                    // Background city image
                    weatherProvider.cityImage != null
                        ? Positioned.fill(
                            child: Hero(
                              tag: 'cityImage_${weatherProvider.weather!.cityName}',
                              child: Image.network(
                                weatherProvider.cityImage!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Container(color: Colors.blueAccent),
                    
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.3), 
                              Colors.black.withOpacity(0.6), 
                            ],
                          ),
                        ),
                      ),
                    ),

                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            weatherProvider.weather!.cityName,
                            style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text("Temperature: ${weatherProvider.weather!.temperature}°C",
                              style: TextStyle(color: Colors.white, fontSize: 20)),
                          Text("Humidity: ${weatherProvider.weather!.humidity}%",
                              style: TextStyle(color: Colors.white, fontSize: 20)),
                          Text("Condition: ${weatherProvider.weather!.condition}",
                              style: TextStyle(color: Colors.white, fontSize: 20)),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }
}
