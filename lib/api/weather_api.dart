import 'dart:convert';
import 'package:weather_app/models/weather_daily.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/utilities/location.dart';

class WeatherApi{
  Future<WeatherForecastDaily> fetchWeatherForecast({String? cityName, bool? isCity}) async{
    Location location = Location();
    await location.getCurrentLocation();
    Map<String, String?> parametres;
    if(isCity == true){
      var queryParameters = {
        'q': cityName,
        'appid': Constants.WEATHER_APP_ID,
        'units': 'metric',
      };
      parametres = queryParameters;
    } else{
      var queryParameters = {
        'appid': Constants.WEATHER_APP_ID,
        'units': 'metric',
        'lat' : location.latitude.toString(),
        'lon' : location.longitude.toString(),
      };
      parametres = queryParameters;
    }
    var url = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN, Constants.WEATHER_FORECAST_PATH, parametres);
    var response = await http.get(url);
    if(response.statusCode == 200){
      return WeatherForecastDaily.fromJson(json.decode(response.body));
    } else{
      return Future.error('Error response');
    }
  }
}