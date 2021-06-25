
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:extended_math/extended_math.dart';

String circleEquationChoice(String A, String B, String C, String D, int fn){
  if(A == '' || B == '' || C == '' || D == '' || double.parse(A) == 0)
    return "CHECK INPUT";
  double a = double.parse(A);
  double b = double.parse(B);
  double c = double.parse(C);
  double d = double.parse(D);
  double h = -b/(2*a);
  double k = -c/(2*a);
  double constant = d/a;
  if(pow(h, 2) + pow(k, 2) - constant < 0){
    return "IMPOSSIBLE CIRCLE";
  }
  String result = '';
  switch(fn){
    case 0: result = center(h, k);
    break;
    case 1: result = radius(h, k, constant);
    break;
  }
  return result;
}

String center(double h, double k){
  String X = h.toStringAsFixedNoZero(precision);
  String Y = k.toStringAsFixedNoZero(precision);
  return "($X,$Y)";
}

String radius(double h, double k, double constant){
  double r = sqrt(pow(h, 2) + pow(k, 2) - constant);
  String Radius = r.toStringAsFixedNoZero(precision);
  return formatNumber(Radius);
}