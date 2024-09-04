
import 'package:weather_app/utilities/constants.dart';

class WeatherForecastDaily {
    City? city;
    String? cod;
    num? message;
    num? cnt;
    List<WeatherList>? list;

    WeatherForecastDaily({this.city, this.cod, this.message, this.cnt, this.list});

    WeatherForecastDaily.fromJson(Map<String, dynamic> json) {
        this.city = json["city"] == null ? null : City.fromJson(json["city"]);
        this.cod = json["cod"];
        this.message = json["message"];
        this.cnt = json["cnt"];
        this.list = json["list"]==null ? null : (json["list"] as List).map((e)=>WeatherList.fromJson(e)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        if(this.city != null)
            data["city"] = this.city?.toJson();
        data["cod"] = this.cod;
        data["message"] = this.message;
        data["cnt"] = this.cnt;
        if(this.list != null)
            data["list"] = this.list?.map((e)=>e.toJson()).toList();
        return data;
    }
}

class WeatherList {
    num? dt;
    num? sunrise;
    num? sunset;
    Temp? temp;
    FeelsLike? feelsLike;
    num? pressure;
    num? humidity;
    List<Weather>? weather;
    num? speed;
    num? deg;
    num? gust;
    num? clouds;
    num? pop;

    WeatherList({this.dt, this.sunrise, this.sunset, this.temp, this.feelsLike, this.pressure, this.humidity, this.weather, this.speed, this.deg, this.gust, this.clouds, this.pop});

    WeatherList.fromJson(Map<String, dynamic> json) {
        this.dt = json["dt"];
        this.sunrise = json["sunrise"];
        this.sunset = json["sunset"];
        this.temp = json["temp"] == null ? null : Temp.fromJson(json["temp"]);
        this.feelsLike = json["feels_like"] == null ? null : FeelsLike.fromJson(json["feels_like"]);
        this.pressure = json["pressure"];
        this.humidity = json["humidity"];
        this.weather = json["weather"]==null ? null : (json["weather"] as List).map((e)=>Weather.fromJson(e)).toList();
        this.speed = json["speed"];
        this.deg = json["deg"];
        this.gust = json["gust"];
        this.clouds = json["clouds"];
        this.pop = json["pop"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data["dt"] = this.dt;
        data["sunrise"] = this.sunrise;
        data["sunset"] = this.sunset;
        if(this.temp != null)
            data["temp"] = this.temp?.toJson();
        if(this.feelsLike != null)
            data["feels_like"] = this.feelsLike?.toJson();
        data["pressure"] = this.pressure;
        data["humidity"] = this.humidity;
        if(this.weather != null)
            data["weather"] = this.weather?.map((e)=>e.toJson()).toList();
        data["speed"] = this.speed;
        data["deg"] = this.deg;
        data["gust"] = this.gust;
        data["clouds"] = this.clouds;
        data["pop"] = this.pop;
        return data;
    }

    String getIconUrl(){
      return '${Constants.WEATHER_IMAGES_URL}${weather![0].icon}.png';
    }
}

class Weather {
    num? id;
    String? main;
    String? description;
    String? icon;

    Weather({this.id, this.main, this.description, this.icon});

    Weather.fromJson(Map<String, dynamic> json) {
        this.id = json["id"];
        this.main = json["main"];
        this.description = json["description"];
        this.icon = json["icon"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data["id"] = this.id;
        data["main"] = this.main;
        data["description"] = this.description;
        data["icon"] = this.icon;
        return data;
    }
}

class FeelsLike {
    num? day;
    num? night;
    num? eve;
    num? morn;

    FeelsLike({this.day, this.night, this.eve, this.morn});

    FeelsLike.fromJson(Map<String, dynamic> json) {
        this.day = json["day"];
        this.night = json["night"];
        this.eve = json["eve"];
        this.morn = json["morn"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data["day"] = this.day;
        data["night"] = this.night;
        data["eve"] = this.eve;
        data["morn"] = this.morn;
        return data;
    }
}

class Temp {
    num? day;
    num? min;
    num? max;
    num? night;
    num? eve;
    num? morn;

    Temp({this.day, this.min, this.max, this.night, this.eve, this.morn});

    Temp.fromJson(Map<String, dynamic> json) {
        this.day = json["day"];
        this.min = json["min"];
        this.max = json["max"];
        this.night = json["night"];
        this.eve = json["eve"];
        this.morn = json["morn"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data["day"] = this.day;
        data["min"] = this.min;
        data["max"] = this.max;
        data["night"] = this.night;
        data["eve"] = this.eve;
        data["morn"] = this.morn;
        return data;
    }
}

class City {
    num? id;
    String? name;
    Coord? coord;
    String? country;
    num? population;
    num? timezone;

    City({this.id, this.name, this.coord, this.country, this.population, this.timezone});

    City.fromJson(Map<String, dynamic> json) {
        this.id = json["id"];
        this.name = json["name"];
        this.coord = json["coord"] == null ? null : Coord.fromJson(json["coord"]);
        this.country = json["country"];
        this.population = json["population"];
        this.timezone = json["timezone"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data["id"] = this.id;
        data["name"] = this.name;
        if(this.coord != null)
            data["coord"] = this.coord?.toJson();
        data["country"] = this.country;
        data["population"] = this.population;
        data["timezone"] = this.timezone;
        return data;
    }
}

class Coord {
    num? lon;
    num? lat;

    Coord({this.lon, this.lat});

    Coord.fromJson(Map<String, dynamic> json) {
        this.lon = json["lon"];
        this.lat = json["lat"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data["lon"] = this.lon;
        data["lat"] = this.lat;
        return data;
    }
}