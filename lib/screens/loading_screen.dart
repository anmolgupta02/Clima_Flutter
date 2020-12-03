import 'dart:convert';

import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'
as http; //using as anotation because it is sort of abstract class where everything is ready for use and no need to create Objs for it. So in order to avoid confusion we are using this.
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation(); //So that the function could be called upon start-up.
    print('Triggered from startup');
    getDataFromAPI();
  }

  double currentLat;
  double currentLong;

  Future getLocation() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    currentLat = loc.latitude.roundToDouble();
    currentLong = loc.longitude.roundToDouble();

    print(currentLat);
    print(currentLong);
  }

  void getDataFromAPI() async {
    String baseURL =
        'http://api.openweathermap.org/data/2.5/weather?lat=29.0&lon=77.0&appid=c7093186b7513eb7f072fb2d5e15d931';
    http.Response apiResponse = await http.get(
        baseURL);
    if (apiResponse.statusCode == 200) {
      String dataFromApiResponse = apiResponse.body;
      print(dataFromApiResponse);

      var decodedData = jsonDecode(dataFromApiResponse);

      var id = decodedData['weather'][0]['id'];
      var temp = decodedData['main']['temp'];
      var city = decodedData['name'];

      print(id);
      print(temp);
      print(city);
    } else {
      print("Here is what went wrong " + apiResponse.statusCode.toString());
      print(baseURL);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
