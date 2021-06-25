import 'dart:math';
import 'package:dream_calc/calcs/trigCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/formatNumber.dart';


String straightLineEquationChoice(String A, String B, String C, int fn){
  if(A == '' || B == '' || C == '')
    return "CHECK INPUT";
  double a = double.parse(A);
  double b = double.parse(B);
  double c = double.parse(C);
  String result = '';
  switch(fn){
    case 0: result = slope(a, b);
    break;
    case 1: result = x_intercept(a, c);
    break;
    case 2: result = y_intercept(b, c);
    break;
    case 3: result = xAxisAngle(a, b);
    break;
    case 4: result = yAxisAngle(a, b);
    break;
  }
  return result;
}

String slope(double a, double b){
  double slope = -a/b;
  String Slope = slope.toStringAsFixedNoZero(precision);
  return formatNumber(Slope);
}

String x_intercept(double a, double c){
  double intercept = -c/a;
  String Intercept = intercept.toStringAsFixedNoZero(precision);
  return formatNumber(Intercept);
}

String y_intercept(double b, double c){
  double intercept = -c/b;
  String Intercept = intercept.toStringAsFixedNoZero(precision);
  return formatNumber(Intercept);
}

String xAxisAngle(double a, double b){
  double slope = -a/b;
  double angle = toDegree(atan(slope));
  String Angle = angle.toStringAsFixedNoZero(precision);
  return Angle + '°';
}

String yAxisAngle(double a, double b){
  double slope = -a/b;
  double angle = 90 - toDegree(atan(slope));
  String Angle = angle.toStringAsFixedNoZero(precision);
  return Angle + '°';
}