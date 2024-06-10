import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Xylophone());
}

class Xylophone extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    void playSound(int soundNumber) {
      final player = AudioCache();
      player.play('note$soundNumber.wav');
    }

    Widget buildSoundKey({int number, Color keyColor}) {
      return Expanded(
        child: Container(
          color: keyColor,
          child: TextButton(
            child: Text(' '),
            onPressed: () {
              playSound(number + 1);
            },
          ),
        ),
      );
    }

    List<Widget> listOfKeys(int num) {
      var colors = [
        Colors.red,
        Colors.orange,
        Colors.yellow,
        Colors.green,
        Colors.blue,
        Colors.purple,
        Colors.pink
      ];
      int j;
      List<Widget> listOfWidget = [];
      for (int i = 0; i < num; i++) {
        j = i % 7;
        listOfWidget.add(buildSoundKey(
          number: j,
          keyColor: colors[j],
        ));
      }
      return listOfWidget;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Xylophone',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 0, 0, 1.0),
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Xylophone',
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1.0),
            ),
          ),
        ),
        body: Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: listOfKeys(7),
            ),
          ),
        ),
      ),
    );
  }
}
