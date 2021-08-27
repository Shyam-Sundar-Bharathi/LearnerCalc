import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/menu.dart';

String equation(String userInputOne, String userInputTwo){
  if(userInputOne == "" || userInputTwo == ""){
    return "CHECK INPUT";
  }

  double rootOne = double.parse(userInputOne);
  double rootTwo = double.parse(userInputTwo);
  if(rootOne == 0 && rootTwo == 0)
    return "x^2 = 0";
  double sumOfRoots = rootOne + rootTwo;
  double productOfRoots = rootOne*rootTwo;
  String signOne = sumOfRoots < 0 ? '+' : '-';
  String signTwo = productOfRoots < 0 ? '-' : '+';
  String sum = sumOfRoots > 0 ? sumOfRoots.toStringAsFixedNoZero(precision) : (-sumOfRoots).toStringAsFixedNoZero(precision);
  String product = productOfRoots > 0 ? productOfRoots.toStringAsFixedNoZero(precision) : (-productOfRoots).toStringAsFixedNoZero(precision);
  if(sumOfRoots == 0){
    return "x^2 ${signTwo} ${product} = 0";
  }
  if(productOfRoots == 0){
    return "x^2 ${signOne} ${sum} = 0";
  }
  return "x^2 ${signOne} ${sum}x ${signTwo} ${product} = 0";
}