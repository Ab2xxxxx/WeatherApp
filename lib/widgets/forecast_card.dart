import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_daily.dart';
import 'package:weather_app/utilities/forecast_util.dart';

Widget ForecastCard(AsyncSnapshot<WeatherForecastDaily> snapshot, int index){
  var forecast = snapshot.data!.list;
  DateTime date = DateTime.fromMillisecondsSinceEpoch(forecast![index].dt!.toInt() * 1000);
  var fullDate = Util.getFormattedDate(date);
  var dayOfWeek = fullDate.split(',')[0];
  var tempMin = forecast[index].temp!.min!.toStringAsFixed(0);
  var tempMax = forecast[index].temp!.max!.toStringAsFixed(0);
  var icon = forecast[index].getIconUrl();
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(dayOfWeek, style: TextStyle(fontSize: 22, color: Colors.white),),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(4),
                child: Text('$tempMin `C - $tempMax `C', style: TextStyle(fontSize: 20, color: Colors.white),),
              )
            ],
          )
        ],
      )
    ],
  );
}