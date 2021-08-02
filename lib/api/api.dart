import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vipcoder/const/const.dart';

class Api {
  // Methods
  // Get Data
  // baseurl is in const folder String baseurl = "http://192.168.1.4:3000/";
  Future getData(String endpoint) async {
    var response = await http.get(Uri.parse(baseurl + endpoint),
        headers: {'Accept': 'application/json'});
    return response;
  }

  // Post Data
  Future postData(Map data, String endpoint) async {
    var response = await http.post(Uri.parse(baseurl + endpoint),
        headers: {
          'Content-type': 'Application/json',
          'Accept': 'Application/json'
        },
        body: jsonEncode(data));
    return response;
  }
}
