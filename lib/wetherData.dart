
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'wethetModel.dart';

class WeatherData{
  Future<Weather> getData(var latitude , var longitude) async {
    var uri = Uri.parse('http://api.weatherapi.com/v1/current.json?key=942d3ba46592440e80d51636230104&q=$latitude,$longitude&aqi=no');
    var response = await http.get(uri);
    var body = jsonDecode(response.body);
    return Weather.formJson(body);
  }
}