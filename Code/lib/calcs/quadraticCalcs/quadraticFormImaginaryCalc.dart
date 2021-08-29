import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:extended_math/extended_math.dart';

String equation(String userInputOne, String userInputTwo){
  if(userInputOne == "" || userInputTwo == ""){
    return "CHECK INPUT";
  }
  double real = double.parse(userInputOne);
  double imaginary = double.parse(userInputTwo);
  if(real == 0 && imaginary == 0)
    return "x^2 = 0";
  double sumOfRoots = 2*real;
  double productOfRoots = pow(real, 2) + pow(imaginary, 2);
  String signOne = sumOfRoots < 0 ? '+' : '-';
  String signTwo = productOfRoots < 0 ? '-' : '+';
  String sum = sumOfRoots > 0 ? sumOfRoots.toStringAsFixedNoZero(precision) : (-sumOfRoots).toStringAsFixedNoZero(precision);
  String product = productOfRoots > 0 ? productOfRoots.toStringAsFixedNoZero(precision) : (-productOfRoots).toStringAsFixedNoZero(precision);
  if(sumOfRoots == 0){
    return "x^2 ${signTwo} ${product} = 0";
  }
  return "x^2 ${signOne} ${sum}x ${signTwo} ${product} = 0";
}