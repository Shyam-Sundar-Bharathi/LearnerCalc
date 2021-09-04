import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:extended_math/extended_math.dart';

String harmonicChoice(String A, String D, String N, int fn){
  if(A == '' || D == '' || N == '')
    return "CHECK INPUT";
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
  double term = 1/(a + ((n-1)*d));
  String Term = term.toStringAsFixedNoZero(precision);
  return formatNumber(Term);
}

String sum(double a, double d, double n){
  if(d == 0){
    double sum = n/a;
    String Sum = sum.toStringAsFixedNoZero(precision);
    return Sum;
  }
  double sum  = (1/d)*log((2*a + (2*n - 1)*d)/(2*a - d));
  String Sum = sum.toStringAsFixedNoZero(precision);
  return formatNumber(Sum);
}