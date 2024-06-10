import 'package:bmi/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'constants.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context)=>InputPage(),
          '/result':(context)=>ResultPage(),
        },
        initialRoute:'/' ,
        theme:
        ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E21),
          scaffoldBackgroundColor: Color(0xFF0A0E21),
          //slider in input page
          sliderTheme: SliderTheme.of(context).copyWith(
            inactiveTrackColor:  Color(0xFF8B8E98),
              thumbColor: kBottomContainerColor,
              activeTrackColor: Colors.white,
              overlayColor: Color(0x29eb1555),
              thumbShape: RoundSliderThumbShape(
                enabledThumbRadius: 18.0,
              ),
              overlayShape: RoundSliderOverlayShape(
                overlayRadius: 30.0,
              )),
        ));
  }
}
