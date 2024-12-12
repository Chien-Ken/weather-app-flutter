import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/app/utils/assets.dart';
import 'package:weather_app/models/weather.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({super.key, required this.listData});
  final List<WeatherDetail> listData;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(20),
      itemCount: listData.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 10,) ;
      },
      itemBuilder: (BuildContext context, int index) {
    DateTime dateTime = DateTime.parse(listData[index].dt_txt);
    String formatDay = DateFormat('EEEE').format(dateTime);
    String formatTime = DateFormat('HH-mm').format(dateTime);

        return Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
             color: Colors.white54,
             borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            children: [
              Expanded(child: 
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                       createTemp(listData[index].main.temp, size: 30),
                       SizedBox(width: 20,),
                  Text(listData[index].weather.main, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), )
                    ],
                  ),
                  Text(formatDay, style: TextStyle(color: Colors.blue, fontSize: 16),),
                  SizedBox(height: 10,),
                  Text(formatTime, style: TextStyle(color: Colors.white, fontSize: 16),)
                 
                ],
              )
              ),
              Image.asset(
                width: MediaQuery.sizeOf(context).width/3,
                AssetsCustom.getLinkImg(listData[index].weather.main))
            ],
          ),
         
        ) ;
      },
    );
  }
}