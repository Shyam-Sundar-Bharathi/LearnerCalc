import 'dart:math';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/formatNumber.dart';

String geometricChoice(String A, String R, String N, int fn){
  if(A == '' || R == '' || N == '')
    return "INPUT";
  double a = double.parse(A);
  double r = double.parse(R);
  double n = double.parse(N);
  String result = '';
  switch(fn){
    case 0: result = nthTerm(a, r, n);
    break;
    case 1: result = sum(a, r, n);
    break;
  }
  return result;
}

String nthTerm(double a, double r, double n){
  double term = a*pow(r, n-1);
  String Term = term.toStringAsFixedNoZero(precision);
  return Term;
}

String sum(double a, double r, double n){
  if(r == 1){
    double sum = n*a;
    String Sum = sum.toStringAsFixedNoZero(precision);
    return Sum;
  }
  double sum = (a * (pow(r, n) - 1))/(r-1);
  String Sum = sum.toStringAsFixedNoZero(precision);
  if(Sum == '-0')
    Sum = '0';
  return Sum;
}