import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/pages/home/widgets/home_details_weather.dart';
import 'package:weather_app/pages/home/widgets/home_location.dart';
import 'package:weather_app/pages/home/widgets/home_temperature.dart';
import 'package:weather_app/pages/home/widgets/home_weather_icon.dart';
import 'package:weather_app/providers/weather_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherProvider>().getWeatherCurrent();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
             Color(0xff1D6CF3),
              Color(0xff19D2FE),
            ])
        ),
        child: FutureBuilder(
          future: context.read<WeatherProvider>().getWeatherCurrent(),
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
            }
            if(!snapshot.hasData) {
              return Center(child: Container(child: Text('No data'),),);
            }
            WeatherData data = snapshot.data as WeatherData;
           
            return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HomeWeatherIcon(nameIcon: data.weather[0].main ,),
              HomeTemperature(temp: data.main.temp,),
              HomeLocation(location: data.name,),
              SizedBox(height: 20,),
              HomeDetailsWeather(humidity: data.main.humidity, speed: data.wind.speed,)
            ],
          );
        
          },
        ),
        
        ),
      );
   
  }
}
