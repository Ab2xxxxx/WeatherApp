import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/models/weather_daily.dart';
import 'package:weather_app/utilities/forecast_util.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.snapshot});
  
  final AsyncSnapshot<WeatherForecastDaily> snapshot;

  @override
  Widget build(BuildContext context) {
    var forecast = snapshot.data!.list;
    var pressure = forecast![0].pressure! * 0.750062;
    var humidity = forecast![0].humidity;
    var wind = forecast![0].speed;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Util.getItem(FontAwesomeIcons.temperatureThreeQuarters, pressure.round(), 'mm Hg'),
          Util.getItem(FontAwesomeIcons.cloudRain, humidity!.toInt(), '%'),
          Util.getItem(FontAwesomeIcons.wind, wind!.toInt(), 'm/s'),
        ],
      ),
    );
  }
}