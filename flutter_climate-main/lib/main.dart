import 'package:climate/screens/city_screen.dart';
import 'package:climate/screens/loading_screen.dart';
import 'package:climate/screens/location_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        '/': (context)=>LoadingScreen(),
        '/location_screen':(context)=>LocationScreen(),
        '/city_screen':(context)=>CityScreen(),
      },
      initialRoute: '/',
    );
  }
}
