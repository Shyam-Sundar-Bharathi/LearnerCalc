import 'package:dream_calc/services/formatNumber.dart';

String percentOne(String userInputOne, String userInputTwo, int precision){
  if(userInputOne == '' || userInputTwo == '')
    return ' ';
  return (double.parse(userInputOne) * double.parse(userInputTwo) / 100).toStringAsFixedNoZero(precision);
}

String percentTwo(String userInputThree, String userInputFour, int precision){
  if(userInputThree == '' || userInputFour == '')
    return ' ';
  return (double.parse(userInputThree) / double.parse(userInputFour) * 100).toStringAsFixedNoZero(precision);
}

