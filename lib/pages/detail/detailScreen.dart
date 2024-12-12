import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/app/config/Theme_Custom.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/pages/detail/widget/detail_body.dart';
import 'package:weather_app/providers/weather_provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        future: context.read<WeatherProvider>().getWeatherDetails(),
        initialData: null,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          }
          if(!snapshot.hasData) {
            return Center(child: Text('no data'),);
          }
          List<WeatherDetail> listData = snapshot.data as List<WeatherDetail>;
          return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Row(
            children: [
                Icon(CupertinoIcons.location , color: Colors.white,),
                SizedBox(width: 15,),
                Text('Ha Noi City', style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
                ),),
        
            ]
          
          ),
          actions: [
            Icon(CupertinoIcons.search),
            SizedBox(width: 15,)
          ],
        ),
             body: DetailBody(listData: listData,),
        );
        },
      ),
        
      
    );
  }
}