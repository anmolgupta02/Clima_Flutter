import 'package:geolocator/geolocator.dart';

class Location {
  Location() {
    getCurrentLocation();
  }

  double longitude;
  double latitude;

  Future getCurrentLocation() async {
    Position position;

    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      //print(position);
      longitude = position.longitude;
      latitude = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}
