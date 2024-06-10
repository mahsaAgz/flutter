import 'package:climate/services/location.dart';
import 'package:climate/services/networking.dart';
import 'package:flutter/material.dart';
import 'dart:math';

const String appid="1e8651e3a80e65d797d33adba72cbe06";
const authority='api.openweathermap.org';
const unencodedPath='/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getLocationWeather() async {
    double lat;
    double lon;
    Location loc = Location();
    await loc.getCurrentLocation();
    lon = loc.longitude;
    lat = loc.latitude;
    var requestData = {
      "lat": "$lat",
      "lon": "$lon",
      "appid": appid,
      "units": "metric",
    };

    var url = Uri.https(authority, unencodedPath, requestData);
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    var requestData = {
      "q": "$cityName",
      "appid": appid,
      "units": "metric",
    };
    var url = Uri.https(authority, unencodedPath, requestData);
    NetworkHelper networkHelper = NetworkHelper(url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition >= 800) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}