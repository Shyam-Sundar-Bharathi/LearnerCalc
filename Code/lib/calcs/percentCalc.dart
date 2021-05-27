import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/menu.dart';

String percentOne(String userInputOne, String userInputTwo){
  if(userInputOne == '' || userInputTwo == '')
    return ' ';
  return formatNumber((double.parse(userInputOne) * double.parse(userInputTwo) / 100).toStringAsFixedNoZero(10));
}

String percentTwo(String userInputThree, String userInputFour){
  if(userInputThree == '' || userInputFour == '')
    return ' ';
  return formatNumber((double.parse(userInputThree) / double.parse(userInputFour) * 100).toStringAsFixedNoZero(10));
}

