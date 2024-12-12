import 'package:flutter/material.dart';

class HomeDetailsWeather extends StatelessWidget {
  const HomeDetailsWeather({super.key, required this.humidity, required this.speed});
  final num humidity;
  final num speed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Image.asset('assets/Vector.png'),
            Text('${humidity}km/h')
          ],
        ),
        Column(
          children: [
            Image.asset('assets/heavyrain.png'),
            Text('${speed} %')
          ],
        )
      ],
    );
  }
}