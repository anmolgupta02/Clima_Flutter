import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.baseURL);

  final String baseURL;

  Future getData() async {
    print(baseURL);
    http.Response apiResponse = await http.get(baseURL);

    if (apiResponse.statusCode == 200) {
      String dataFromApiResponse = apiResponse.body;
      print(dataFromApiResponse);
      return jsonDecode(dataFromApiResponse);
    } else {
      print("Here is what went wrong " + apiResponse.statusCode.toString());
      print(baseURL);
    }
  }
}
