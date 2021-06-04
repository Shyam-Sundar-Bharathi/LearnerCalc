import 'package:dream_calc/services/formatNumber.dart';

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

String percentThree(String userInputFour, String userInputFive, String userInputSix){
  if(userInputFour == '' || userInputFive == '' || userInputSix == '')
    return ' ';
  double one = double.parse(userInputFour);
  double two = double.parse(userInputFive);
  double three = double.parse(userInputSix);
  return formatNumber((one*(two*three/100))/100);
}

