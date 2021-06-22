import 'dart:math';

import 'package:dream_calc/calcs/trigCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/formatNumber.dart';

String arithmeticChoice(String A, String D, String N, int fn){
  if(A == '' || D == '' || N == '')
    return "INPUT";
  double a = double.parse(A);
  double d = double.parse(D);
  double n = double.parse(N);
  String result = '';
  switch(fn){
    case 0: result = nthTerm(a, d, n);
    break;
    case 1: result = sum(a, d, n);
    break;
  }
  return result;
}

String nthTerm(double a, double d, double n){
  double term = a + ((n-1)*d);
  String Term = term.toStringAsFixedNoZero(precision);
  return Term;
}

String sum(double a, double d, double n){
  double sum = (n/2)*((2*a) + (n-1)*d);
  String Sum = sum.toStringAsFixedNoZero(precision);
  return Sum;
}