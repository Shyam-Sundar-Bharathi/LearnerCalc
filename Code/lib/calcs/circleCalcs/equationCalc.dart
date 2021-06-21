
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:extended_math/extended_math.dart';

String circleEquationChoice(String A, String B, String C, String D, int fn){
  if(A == '' || B == '' || C == '' || D == '' || double.parse(A) == 0)
    return "INPUT";
  double a = double.parse(A);
  double b = double.parse(B);
  double c = double.parse(C);
  double d = double.parse(D);
  String result = '';
  switch(fn){
    case 0: result = center(a, b, c);
    break;
    case 1: result = radius(a, b, c, d);
    break;
  }
  return result;
}

String center(double a, double b, double c){
  double x = -b/(2*a);
  double y = -c/(2*a);
  String X = x.toStringAsFixedNoZero(precision);
  String Y = y.toStringAsFixedNoZero(precision);
  return "($X,$Y)";
}

String radius(double a, double b, double c, double d){
  double constant = d/a;
  double h = b/(2*a);
  double k = c/(2*a);
  double r = pow(pow(h, 2) + pow(k, 2) - constant, 0.5);
  String R = r.toStringAsFixedNoZero(precision);
  return R;
}