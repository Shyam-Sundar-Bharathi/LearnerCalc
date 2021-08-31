import 'dart:math';

import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/menu.dart';

String equation(String userInputOne, String userInputTwo, String userInputThree){
  if(userInputOne == "" || userInputTwo == "" || userInputThree == ""){
    return "CHECK INPUT";
  }

  double realRoot = double.parse(userInputOne);
  double complexReal = double.parse(userInputTwo);
  double complexImaginary = double.parse(userInputThree);

  if(realRoot == 0 && complexReal == 0 && complexImaginary == 0)
    return "x^3 = 0";
  double sumOfRoots = realRoot + 2*complexReal;
  double sumOfRootsTwo = pow(complexReal,2) + pow(complexImaginary, 2) + realRoot*2*complexReal;
  double productOfRoots = realRoot*(pow(complexReal,2) + pow(complexImaginary, 2));
  String signOne = sumOfRoots < 0 ? '+' : '-';
  String signTwo = sumOfRootsTwo < 0 ? '-' : '+';
  String signThree = productOfRoots < 0 ? '+' : '-';
  String sum = sumOfRoots > 0 ? formatNumber(sumOfRoots.toStringAsFixedNoZero(precision)) : formatNumber((-sumOfRoots).toStringAsFixedNoZero(precision));
  String sumTwo = sumOfRootsTwo > 0 ? formatNumber(sumOfRootsTwo.toStringAsFixedNoZero(precision)) : formatNumber((-sumOfRootsTwo).toStringAsFixedNoZero(precision));
  String product = productOfRoots > 0 ? formatNumber(productOfRoots.toStringAsFixedNoZero(precision)) : formatNumber((-productOfRoots).toStringAsFixedNoZero(precision));
  if(sumOfRoots == 0 && sumOfRootsTwo == 0){
    return "x^3 ${signThree} ${product} = 0";
  }
  if(sumOfRoots == 0 && productOfRoots == 0){
    return "x^3 ${signTwo} ${sumTwo}x = 0";
  }
  if(sumOfRootsTwo == 0 && productOfRoots == 0){
    return "x^3 ${signOne} ${sum}x^2 = 0";
  }
  if(sumOfRoots == 0){
    return "x^3 ${signTwo} ${sumTwo}x ${signThree} ${product} = 0";
  }
  if(sumOfRootsTwo == 0){
    return "x^3 ${signOne} ${sum}x^2 ${signThree} ${product} = 0";
  }
  if(productOfRoots == 0){
    return "x^3 ${signOne} ${sum}x^2 ${signTwo} ${sumTwo}x = 0";
  }
  return "x^3 ${signOne} ${sum}x^2 ${signTwo} ${sumTwo}x ${signThree} ${product} = 0";
}