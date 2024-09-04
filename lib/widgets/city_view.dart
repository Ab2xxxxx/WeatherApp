import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_daily.dart';
import 'package:weather_app/utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  const CityView({super.key, required this.snapshot});

  final AsyncSnapshot<WeatherForecastDaily> snapshot;

  @override
  Widget build(BuildContext context) {
    var city = snapshot.data!.city!.name;
    var country = snapshot.data!.city!.country;
    var forecastList = snapshot.data!.list;
    var formattedDate = DateTime.fromMillisecondsSinceEpoch(((forecastList![0].dt)!*1000).toInt());
    
    return Container(
      child: Column(
        children: [
          Text('$city $country', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28, color: Colors.black87),),
          Text('${Util.getFormattedDate(formattedDate)}', style: TextStyle(fontSize: 15),)
        ],
      ),
    );
  }
}