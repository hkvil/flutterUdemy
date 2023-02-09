import 'dart:math';

class Calculate{
  Calculate({required this.height,required this.weight});

  final int height;
  final int weight;
  late double _bmi;

  String calculateBMI(){
    _bmi = weight/pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }
  String getResult(){
    if (_bmi>=25){
      return 'OVERWEIGHT';
    }else if(_bmi>18.5){
      return 'NORMAL';
    }else{
      return 'UNDERWEIGHT';
    }
  }
  String getInterpretation(){
    if (_bmi>=25){
      return 'You OVER the Limit,Try Fasting until normal.';
    }else if(_bmi>18.5){
      return 'You have a normal body weight,good.';
    }else{
      return 'You have less than normal body weight,eat more!';
    }
  }
}