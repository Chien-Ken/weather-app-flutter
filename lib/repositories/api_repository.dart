import 'package:dio/dio.dart';
import 'package:weather_app/app/utils/assets.dart';
import 'package:weather_app/models/weather.dart';

class ApiRepository {
  static Future<WeatherData> callApiGetWeather() async {
    try {
      final dio = Dio();
      final res = await dio.get(
          'https://api.openweathermap.org/data/2.5/weather?lat=21.0245&lon=105.8412&appid=${MyKey.api_token}&units=metric');
      final data = res.data;
      WeatherData result = WeatherData.fromMap(data);
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

    static Future<List<WeatherDetail>> callApiGetWeatherDetail() async {
    try {
      final dio = Dio();
      final res = await dio.get(
          'https://api.openweathermap.org/data/2.5/forecast?lat=44.34&lon=10.99&appid=09644fdd55b08c97122d85d748fc34db&units=metric');
      final data = res.data['list'];
      List<WeatherDetail> result = List<WeatherDetail>.from(data.map((e) => WeatherDetail.fromMap(e)).toList());
      return result;
    } catch (e) {
      print(e);
      rethrow;
    }
  }


}