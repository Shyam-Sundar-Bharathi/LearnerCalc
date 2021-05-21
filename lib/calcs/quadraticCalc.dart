import 'dart:math';
import 'package:extended_math/extended_math.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/genScreen.dart';

List<String> quadCalc(String A, String B, String C){
  double a = double.parse(A);
  double b = double.parse(B);
  double c = double.parse(C);
  final equation = QuadraticEquation(a: a, b: b, c: c);
  bool isReal = b*b - 4*a*c >= 0? true : false;
  double d = (b*b)-(4*a*c);
  String rootOne, rootTwo;
  if(isReal){
    rootOne = formatNumber(double.parse(((-b + pow(d,0.5))/2*a).toStringAsFixedNoZero(precision)));
    rootTwo = formatNumber(double.parse(((-b - pow(d,0.5))/2*a).toStringAsFixedNoZero(precision)));
  }
  else{
    rootOne = formatNumber(double.parse((-b/(2*a)).toStringAsFixedNoZero(precision))) + ' + ' + formatNumber(double.parse((pow(-d,0.5)/2*a).toStringAsFixedNoZero(precision))) + ' i';
    rootTwo = formatNumber(double.parse((-b/(2*a)).toStringAsFixedNoZero(precision))) + ' - ' + formatNumber(double.parse((pow(-d,0.5)/2*a).toStringAsFixedNoZero(precision))) + ' i';
  }

  return [rootOne,rootTwo,formatNumber(double.parse(equation.discriminant().toDouble().toStringAsFixedNoZero(precision))), isReal.toString()];
}