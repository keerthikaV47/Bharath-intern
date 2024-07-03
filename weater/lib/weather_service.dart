import 'package:http/http.dart' as http;
import 'dart:convert';
import 'weather_model.dart';

class WeatherService {
  final String apiKey =
      '9bad1d2420d1a276d38a74c102c94bc9'; // Replace with your OpenWeatherMap API key
  final String apiUrl = 'http://api.openweathermap.org/data/2.5/weather';

  Future<Weather> fetchWeather(String city) async {
    final response =
        await http.get(Uri.parse('$apiUrl?q=$city&appid=$apiKey&units=metric'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return Weather.fromJson(json);
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
