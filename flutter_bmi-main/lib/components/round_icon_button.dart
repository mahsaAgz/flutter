import 'package:flutter/material.dart';
class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.onPressed, @required this.icon});

  final Function onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 0.0,
      shape: CircleBorder(),
      fillColor: Color(0xFF7A7A80),
      textStyle: TextStyle(
        color: Colors.white,
      ),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}
