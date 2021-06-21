import 'dart:math';

import 'package:dream_calc/calcs/trigCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:equations/equations.dart';

String straightLinePointSlopeChoice(String X, String Y, String M, int fn){
  if(X == '' || Y == '' || M == '')
    return "INPUT";
  double x = double.parse(X);
  double y = double.parse(Y);
  double m = double.parse(M);
  String result = '';
  switch(fn){
    case 0: result = equation(x, y, m);
    break;
    case 1: result = x_intercept(x, y, m);
    break;
    case 2: result = y_intercept(x, y, m);
    break;
    case 3: result = xAxisAngle(m);
    break;
    case 4: result = yAxisAngle(m);
  }
  return result;
}

String equation(double x, double y, double m){
  double slope = m;
  double constant = y - slope*x;
  if(slope == 0){
    double constant = y;
    String Constant = constant.toStringAsFixedNoZero(precision);
    return "y = ${Constant}";
  }
  String Slope = slope.toStringAsFixedNoZero(precision);
  String Constant = constant.toStringAsFixedNoZero(precision);
  String sign = constant >=0 ? '+' : '-';
  if(slope == 1)
    Slope = '';
  if(slope == -1)
    Slope = '-';
  if(constant == 0){
    Constant = '';
    sign = '';
  }
  return "y = ${Slope}x ${sign} ${Constant}";
}

String x_intercept(double x, double y, double m){
  return (x - (y/m)).toStringAsFixedNoZero(precision);
}

String y_intercept(double x, double y, double m){
  return (y - m*x).toStringAsFixedNoZero(precision);
}

String xAxisAngle(double m){
  return toDegree(atan(m)).toStringAsFixedNoZero(precision) + '°';
}

String yAxisAngle(double m){
  return (90 - toDegree(atan(m))).toStringAsFixedNoZero(precision) + '°';
}