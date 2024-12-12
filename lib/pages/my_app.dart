import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/config/Theme_Custom.dart';
import 'package:weather_app/pages/bottom_navigation_custom/bottom_custom.dart';
import 'package:weather_app/pages/home/home_screen.dart';
import 'package:weather_app/providers/weather_provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
      ],
      child: MaterialApp(
        theme: ThemeCustom.themeLight,
        debugShowCheckedModeBanner: false,
        home: BottomCustom(),
      ),
    );
  }
}
