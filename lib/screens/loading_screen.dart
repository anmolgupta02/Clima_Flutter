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

  Future getLocation() async {
    Location loc = Location();
    await loc.getCurrentLocation();
    print(loc.latitude);
    print(loc.longitude);
  }

  void getDataFromAPI() async {
    http.Response apiResponse = await http.get(
        'http://api.openweathermap.org/data/2.5/weather?lat=28.63&lon=77.21&appid=c7093186b7513eb7f072fb2d5e15d931');
    if (apiResponse.statusCode == 200) {
      String dataFromApiResponse = apiResponse.body;
      print(dataFromApiResponse);
    } else {
      print("Here is what went wrong " + apiResponse.statusCode.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
