import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/genScreen.dart';

String percentOne(String userInputOne, String userInputTwo){
  if(userInputOne == '' || userInputTwo == '')
    return ' ';
  return (double.parse(userInputOne) * double.parse(userInputTwo) / 100).toStringAsFixedNoZero(precision);
}

String percentTwo(String userInputThree, String userInputFour){
  if(userInputThree == '' || userInputFour == '')
    return ' ';
  return (double.parse(userInputThree) / double.parse(userInputFour) * 100).toStringAsFixedNoZero(precision);
}

