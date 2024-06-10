import 'package:flutter/material.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> answerKeeper = [];
  QuizBrain quizBrain = QuizBrain();
  int trueCounter = 0;
  int falseCounter = 0;

  void checkAnswer(bool userPick) {
    setState(() {
      if(quizBrain.isFinish()){
        if (quizBrain.getAnswer() == userPick) {
          trueCounter++;
        }
        else {
          falseCounter++;
        }
        int qCount = quizBrain.questionsCount();
        if (trueCounter > falseCounter) {
          var alertStyle = AlertStyle(
            animationType: AnimationType.grow,
            isCloseButton: false,
            isOverlayTapDismiss: false,
            descStyle: TextStyle(fontWeight: FontWeight.bold),
            descTextAlign: TextAlign.center,
            animationDuration: Duration(milliseconds: 400),
            alertBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(
                color: Colors.grey,
              ),
            ),
            titleStyle: TextStyle(
              color: Colors.green,
            ),
            alertAlignment: Alignment.center,
          );
          Alert(
            context: context,
            style: alertStyle,
            type: AlertType.success,
            title: "You Won :)",
            desc: "You Score: $trueCounter / $qCount",
            buttons: [
              DialogButton(
                child: Text(
                  "RESTART",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Color.fromRGBO(0, 179, 134, 1.0),
                radius: BorderRadius.circular(0.0),
              ),
            ],
          ).show();
        } else {
          var alertStyle = AlertStyle(
            animationType: AnimationType.grow,
            isCloseButton: false,
            isOverlayTapDismiss: false,
            descStyle: TextStyle(fontWeight: FontWeight.bold),
            descTextAlign: TextAlign.center,
            animationDuration: Duration(milliseconds: 400),
            alertBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(
                color: Colors.grey,
              ),
            ),
            titleStyle: TextStyle(
              color: Colors.red,
            ),
            alertAlignment: Alignment.center,
          );
          Alert(
            context: context,
            style: alertStyle,
            type: AlertType.error,
            title: "You Lost :(",
            desc: "You Score: $trueCounter / $qCount",
            buttons: [
              DialogButton(
                child: Text(
                  "RESTART",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Color.fromRGBO(0, 179, 134, 1.0),
                radius: BorderRadius.circular(0.0),
              ),
            ],
          ).show();
        }
        trueCounter = 0;
        falseCounter = 0;
        answerKeeper = [];
        quizBrain.restart();
      }
      else{
        if (quizBrain.getAnswer() == userPick) {
          answerKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          trueCounter++;
        }
        else {
          answerKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
          falseCounter++;
        }
        quizBrain.nextQuestion();
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
                onSurface: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
                onSurface: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ),
        Row(
          children: answerKeeper,
        ),
      ],
    );
  }
}
