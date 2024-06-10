import 'package:flutter/material.dart';
import '../constants.dart';
import '../components/reusableCard.dart';
import '../components/bottom_button.dart';

class ResultPage extends StatelessWidget {

  Map data={};
  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('bmi result'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Container(
                padding:EdgeInsets.all(15.0),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'your result',
                  style: kTitleStyle,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: ReusableCard(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      data['resultText'],
                      style: kResultTextStyle,
                    ),
                    Text(
                      data['bmiCal'],
                      style: kBmiResultStyle,
                    ),
                    Text(
                      data['interpretation'],
                      style: kBodyTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: BottomButton(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                buttonTitle: 'Re-Calculate',
              ),
            )
          ],
        ),
      ),
    );
  }
}


