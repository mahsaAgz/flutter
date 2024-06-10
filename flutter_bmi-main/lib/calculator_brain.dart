import 'dart:math';
enum Gender {
  female,
  male,
}

class CalculatorBrain{
  CalculatorBrain({this.height,this.weight});
  final int height;
  final int weight;
  double _bmi;
  String calculateBmi(){
    _bmi = weight/pow(height/100,2);
    return  _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi < 18.5){
      return 'UnderWeight';
    }
    else if(_bmi>=25){
      return 'OverWeight';
    }
    else{
      return 'Normal';
    }
  }

  String getInterpretation(){
    if(_bmi < 18.5){
      return 'You have a lower than normal body weight. \n You can eat a bit more. ';
    }
    else if(_bmi>=25){
      return 'You have a higher than normal body weight. \n Try to exercise more. ';
    }
    else{
      return 'You have a normal body weight. \n GOOD JOB :)';
    }
  }

}