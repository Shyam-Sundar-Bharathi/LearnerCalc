import 'dart:ui';

import 'package:dream_calc/calcs/lcmhcfCalc.dart';
import 'package:dream_calc/calcs/trigCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:extended_math/extended_math.dart';

String straightLineTwoPointChoice(String X1, String Y1, String X2, String Y2, int fn){
  if(X1 == '' || Y1 == '' || X2 == '' || Y2 == '')
    return "CHECK INPUT";
  double x1 = double.parse(X1);
  double y1 = double.parse(Y1);
  double x2 = double.parse(X2);
  double y2 = double.parse(Y2);
  String result = '';
  switch(fn){
    case 0 : result = slope(x1, y1, x2, y2);
    break;
    case 1 : result = equation(x1, y1, x2, y2);
    break;
    case 2 : result = x_intercept(x1, y1, x2, y2);
    break;
    case 3 : result = y_intercept(x1, y1, x2, y2);
    break;
    case 4 : result = xAxisAngle(x1, y1, x2, y2);
    break;
    case 5 : result = yAxisAngle(x1, y1, x2, y2);
    break;
  }
  return result;
}

String slope(double x1, double y1, double x2, double y2,{bool forCalc = false}){
  if(forCalc){
    return ((y2 - y1)/(x2 - x1)).toStringAsFixedNoZero(10);
  }
  return ((y2 - y1)/(x2 - x1)).toStringAsFixedNoZero(precision);
}

String equation(double x1, double y1, double x2, double y2){
}

String x_intercept(double x1, double y1, double x2, double y2){
  double m = double.parse(slope(x1, y1, x2, y2, forCalc: true));
  return "${(x1 - y1/m).toStringAsFixedNoZero(precision)}";
}

String y_intercept(double x1, double y1, double x2, double y2){
  double m = double.parse(slope(x1, y1, x2, y2, forCalc: true));
  return "${(y1 - m*x1).toStringAsFixedNoZero(precision)}";
}

String xAxisAngle(double x1, double y1, double x2, double y2){
  return toDegree(atan((y2 - y1)/(x2 - x1))).toStringAsFixedNoZero(precision) + '°';
}

String yAxisAngle(double x1, double y1, double x2, double y2){
  return (90 - toDegree(atan((y2 - y1)/(x2 - x1)))).toStringAsFixedNoZero(precision) + '°';
}