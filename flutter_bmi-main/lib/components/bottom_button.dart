import 'package:flutter/material.dart';
import '../constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({this.buttonTitle,this.onTap});
  final String buttonTitle;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(bottom: 20),
        alignment: Alignment.center,
        child: Text(
          buttonTitle,
          style: kLargButtonStyle,
        ),
        color: kBottomContainerColor,
        height: kBottomContainerHeight,
        width: double.infinity,
      ),
    );
  }
}
