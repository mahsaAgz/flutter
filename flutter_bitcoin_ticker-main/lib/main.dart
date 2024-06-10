import 'package:bitcoin_ticker/loading_page.dart';
import 'package:flutter/material.dart';
import 'price_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: Colors.lightBlue,
          scaffoldBackgroundColor: Colors.white),
      routes: {
        '/':(context)=>LoadingScreen(cur: 'USD'),
        '/price_screen':(context)=>PriceScreen(),
      },
      initialRoute: '/',
    );
  }
}
