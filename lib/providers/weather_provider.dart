import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/repositories/api_repository.dart';

class WeatherProvider extends ChangeNotifier {
  Future<WeatherData> getWeatherCurrent() async {
    WeatherData result = await ApiRepository.callApiGetWeather();
    return result;
  }

   Future<List<WeatherDetail>> getWeatherDetails() async {
   List<WeatherDetail> result = await ApiRepository.callApiGetWeatherDetail();
    return result;
  }

}