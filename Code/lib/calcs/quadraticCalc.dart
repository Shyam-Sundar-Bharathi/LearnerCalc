import 'dart:math';
import 'package:extended_math/extended_math.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/menu.dart';

List<String> quadCalc(String A, String B, String C){
  if(A == "" && B == "" && C == ""){
    return ["CHECK INPUT","CHECK INPUT","CHECK INPUT"];
  }
  if(A == "" || double.parse(A) == 0){
    return ["a CAN'T BE 0.","a CAN'T BE 0","a CAN'T BE 0"];
  }
  if(B == ""){
    B = '0';
  }
  if(C == ""){
    C = '0';
  }

  double a = double.parse(A);
  double b = double.parse(B);
  double c = double.parse(C);
  final equation = QuadraticEquation(a: a, b: b, c: c);
  bool isReal = b*b - 4*a*c >= 0? true : false;
  double d = (b*b)-(4*a*c);
  String rootOne, rootTwo;
  if(isReal){
    rootOne = formatNumber(((-b + pow(d,0.5))/(2*a)).toStringAsFixedNoZero(precision));
    rootTwo = formatNumber(((-b - pow(d,0.5))/(2*a)).toStringAsFixedNoZero(precision));
  }
  else{
    rootOne = formatNumber((-b/(2*a)).toStringAsFixedNoZero(precision)) + ' + ' + formatNumber((pow(-d,0.5)/(2*a)).toStringAsFixedNoZero(precision)) + ' i';
    rootTwo = formatNumber((-b/(2*a)).toStringAsFixedNoZero(precision)) + ' - ' + formatNumber((pow(-d,0.5)/(2*a)).toStringAsFixedNoZero(precision)) + ' i';
  }

  return [rootOne,rootTwo,formatNumber(equation.discriminant().toDouble().toStringAsFixedNoZero(precision))];

}