import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/models/weather_daily.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/widgets/bottom_list_view.dart';
import 'package:weather_app/widgets/city_view.dart';
import 'package:weather_app/widgets/detail_view.dart';
import 'package:weather_app/widgets/temp_view.dart';

class WeatherForecastScreen extends StatefulWidget {
  const WeatherForecastScreen({super.key, this.locationWeather});

  final locationWeather;

  @override
  State<WeatherForecastScreen> createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {

  late Future<WeatherForecastDaily> forecastObject;
  late String _cityName;

  @override
  void initState() {
    super.initState();
    if(widget.locationWeather != null){
      forecastObject = Future.value(widget.locationWeather);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text("Weather", style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: (){
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.location_city),
            onPressed: () async{
              var tappedName = await Navigator.push(context, MaterialPageRoute(
                builder: (context) => CityScreen()));
              if(tappedName != null){
                setState(() {
                  _cityName = tappedName;
                  forecastObject = WeatherApi().fetchWeatherForecast(cityName: _cityName, isCity: true);
                });
              }
            },
            color: Colors.white,
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            child: FutureBuilder<WeatherForecastDaily>(
              future: forecastObject,
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return Column(
                    children: [
                      SizedBox(height: 50),
                      CityView(snapshot: snapshot),
                      SizedBox(height: 50),
                      TempView(snapshot: snapshot),
                      SizedBox(height: 50),
                      DetailView(snapshot: snapshot),
                      SizedBox(height: 50),
                      BottomListView(snapshot: snapshot),
                    ],
                  );
                } else{
                  return Center(
                    child: Text('City not found!', style: TextStyle(fontSize: 25), textAlign: TextAlign.center)
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}