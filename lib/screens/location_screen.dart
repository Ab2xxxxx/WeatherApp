import 'package:flutter/material.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/screens/weather_forecast_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  void getLocationData() async{
    try {
      var weatherInfo = await WeatherApi().fetchWeatherForecast();
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return WeatherForecastScreen(locationWeather: weatherInfo,);
      }));
    } catch (e) {
      throw 'Error $e'; 
    }
  }


  @override
  void initState() {
    super.initState();
    getLocationData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}