import 'package:geolocator/geolocator.dart';

class Location{
  late double latitude;
  late double longitude;

  Future<void> getCurrentLocation() async{
    try {
      final LocationSettings locationSettings = LocationSettings(
        accuracy: LocationAccuracy.low,
        distanceFilter: 10,
        timeLimit: Duration(seconds: 15),
      );
      Position position = await Geolocator.getCurrentPosition(locationSettings: locationSettings);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      throw 'Error $e';
    }
  }
}