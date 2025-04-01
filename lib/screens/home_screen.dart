import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import 'weather_details_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return WillPopScope(
      onWillPop: () async {
        weatherProvider.clearImage();
        setState(() {});
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Weather App"),
          actions: [
            IconButton(
              icon: Icon(weatherProvider.themeMode == ThemeMode.light
                  ? Icons.dark_mode
                  : Icons.light_mode),
              onPressed: () {
                weatherProvider.toggleTheme();
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: "Enter city name",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  final city = _controller.text.trim();
                  if (city.isNotEmpty) {
                    weatherProvider.fetchWeather(city).then((_) {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 500),
                          pageBuilder: (_, __, ___) => WeatherDetailsScreen(),
                          transitionsBuilder: (_, animation, __, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      ).then((_) {
                        weatherProvider.clearImage();
                        setState(() {});
                      });
                    });
                  }
                },
                child: Text("Get Weather"),
              ),
              SizedBox(height: 20),
              Consumer<WeatherProvider>(
                builder: (context, weatherProvider, child) {
                  if (weatherProvider.cityImage == null) {
                    return SizedBox.shrink();
                  }
                  return Hero(
                    tag: 'cityImage_${weatherProvider.weather?.cityName}',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        weatherProvider.cityImage!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
