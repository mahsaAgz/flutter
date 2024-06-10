import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Dicee',
            style: TextStyle(
              fontFamily: 'Pacifico',
            ),
          ),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNumber = 3;
  var rightDiceNumber = 4;

  void changeDiceFace() {
    setState(() {
      leftDiceNumber = Random().nextInt(5) + 1;
      rightDiceNumber = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Click to roll Dices",
                style: TextStyle(
                  fontFamily: 'SourceSansPro',
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    changeDiceFace();
                  },
                  child: Image.asset('images/dice$leftDiceNumber.png'),
                  //Image.asset('dice$leftDiceNumber.png')
                ),
              ),
              Expanded(child: TextButton(
                onPressed: () {
                  changeDiceFace();
                },
                child: Image.asset('images/dice$rightDiceNumber.png'),

                //child: Image.asset('dice$leftDiceNumber.png')
              )),
              //child: Image.asset('images/dice$rightDiceNumber.png'))),
            ],
          ),
        ],
      ),
    );
  }
}
