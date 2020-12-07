import 'package:clima/services/weather.dart';
import 'package:clima/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.weatherDataObj});

  final weatherDataObj;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  int temperature;
  String cityName;
  String condition;

  @override
  void initState() {
    super.initState();
    //String weatherDataFromObj = widget.weatherDataObj.toString();
    //print("The Data from OBJ is " + weatherDataFromObj);
    UpdateUI(widget.weatherDataObj);
  }

  String weatherEmoji;
  String weatherMsg;

  void UpdateUI(dynamic weatherData) {
    setState(() {
      WeatherModel weatherModelObj = WeatherModel();
      var condition = weatherData['weather'][0]['id'];
      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      cityName = weatherData['name'];

      weatherEmoji = weatherModelObj.getWeatherIcon(condition);
      weatherMsg = weatherModelObj.getMessage(temperature);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: Container(
          margin: EdgeInsets.only(bottom: 100.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.near_me,
                        size: 50.0,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Icon(
                        Icons.location_city,
                        size: 50.0,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '$temperature°',
                        style: kTempTextStyle,
                      ),
                      Text(
                        weatherEmoji,
                        style: kConditionTextStyle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: Text(
                    weatherMsg + ' in ' + cityName + '!',
                    textAlign: TextAlign.right,
                    style: kMessageTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//var id = weatherData['weather'][0]['id'];
//var temp = weatherData['main']['temp'];
//var city = weatherData['name'];
