import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_daily.dart';
import 'package:weather_app/widgets/forecast_card.dart';

class BottomListView extends StatelessWidget {
  const BottomListView({super.key, required this.snapshot});

  final AsyncSnapshot<WeatherForecastDaily> snapshot;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('7-Day Weather Forecast'.toUpperCase(), style: TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.bold),),
        Container(
          height: 150,
          padding: EdgeInsets.all(16),
          child: ListView.separated( 
            separatorBuilder: (context, index) => SizedBox(width: 8), 
            itemCount: snapshot.data!.list!.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
              width: MediaQuery.of(context).size.width/2.7,
              height: 160,
              color: Colors.black87,
              child: ForecastCard(snapshot, index),
            ),
          ),
        ),
      ],
    );
  }
}