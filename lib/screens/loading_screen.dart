import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'location_screen.dart';

const key = 'c7093186b7513eb7f072fb2d5e15d931';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double currentLat;
  double currentLong;

  @override
  void initState() {
    super.initState();
    getLocationData(); //So that the function could be called upon start-up.
    print('Triggered from Init');
  }

  void getLocationData() async {
//    Location loc = Location();
//    await loc.getCurrentLocation();
//
//    currentLat = loc.latitude;
//    currentLong = loc.longitude;
//
//    NetworkHelper networkHelper = NetworkHelper(
//        'http://api.openweathermap.org/data/2.5/weather?lat=$currentLat&lon=$currentLong&appid=$key&units=metric');
//
//    var weatherData = await networkHelper.getData();
// code has been rebased to weather class to use current location function.

    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();

    //var weatherDataNew = WeatherModel().getLocationWeather() -> Converts the
    // above two lines to 1 short hand notation.

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        weatherDataObj: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: SpinKitWave(
              color: Colors.grey[200],
              size: 100.0,
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Text(
            'We are Doing Some Work for you!',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
