import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_assignments/Api%20Integration/model/WatherModel.dart';
import 'package:flutter_assignments/Api%20Integration/sevices/WeatherServices.dart';

class Weatherpage extends StatefulWidget {
  const Weatherpage({super.key});

  @override
  State<Weatherpage> createState() => _WeatherpageState();
}

class _WeatherpageState extends State<Weatherpage> {
  final _weatherService = WeatherService('9022003ec2bdab68d85decc65e56dedb');
  Weather? _weather;

  // Fetch Weather
  _fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  // Weather Animation Method
  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/anims/Weather/Sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'clear':
        return 'assets/anims/Weather-Sunny.json';

      case 'clouds':
      case 'mist':
      case 'haze':
      case 'fog':
      case 'smoke':
      case 'dust':
      case 'sand':
      case 'ash':
        return 'assets/anims/Weather-cloudy.json';

      case 'rain':
      case 'drizzle':
      case 'shower rain':
      case 'snow':
      case 'squall':
        return 'assets/anims/Weather-Cloud.json';

      case 'thunderstorm':
      case 'tornado':
        return 'assets/anims/Weather-thunder.json';

      default:
        return 'assets/anims/Weather-Sunny.json';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Center(
        child: _weather == null

        // Loading State
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(color: Colors.white),
            SizedBox(height: 20),
            Text(
              'Fetching Weather...',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        )

        // Weather State
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 📍 City Name
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on, color: Colors.white, size: 22),
                SizedBox(width: 6),
                Text(
                  _weather?.cityName ?? '',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            // 🌤️ Condition Label
            Text(
              _weather?.mainCondition ?? '',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                letterSpacing: 1.0,
              ),
            ),

            SizedBox(height: 20),

            // 🎞️ Lottie Animation
            Lottie.asset(
              getWeatherAnimation(_weather?.mainCondition),
              width: 250,
              height: 250,
            ),

            SizedBox(height: 20),

            // 🌡️ Temperature
            Text(
              '${_weather?.temperature?.round() ?? '--'}°C',
              style: TextStyle(
                color: Colors.white,
                fontSize: 60,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 30),

            // 🔄 Refresh Button
            ElevatedButton.icon(
              onPressed: _fetchWeather,
              icon: Icon(Icons.refresh),
              label: Text('Refresh'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue.shade900,
                padding:
                EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}