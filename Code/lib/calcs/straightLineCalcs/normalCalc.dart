import 'dart:math';
import 'package:dream_calc/calcs/trigCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/formatNumber.dart';

String straightLineNormalChoice(String L, String Angle, int fn){
  if(L == '' || Angle == '')
    return "CHECK INPUT";
  double l = double.parse(L);
  double angle = toRadian(double.parse(Angle));
  String result = '';
  switch(fn){
    case 0: result = slope(angle);
    break;
    case 1: result = equation(l, angle);
    break;
    case 2: result = x_intercept(l, angle);
    break;
    case 3: result = y_intercept(l, angle);
    break;
    case 4: result = xAxisAngle(angle);
    break;
    case 5: result = yAxisAngle(angle);
  }
  return result;
}

String slope(double angle){
  return formatNumber((-(1/tan(angle))).toStringAsFixedNoZero(precision));
}

String equation(double l, double angle){
  double coex = cos(angle);
  double coey = sin(angle);
  double constant = l;
  String Coex = coex.toStringAsFixedNoZero(precision);
  String Coey = coey.toStringAsFixedNoZero(precision);
  String Constant = constant.toStringAsFixedNoZero(precision);
  String sign = coey >=0 ? '+' : '';
  if(coex == 1)
    Coex = '';
  if(coex == -1)
    Coex = '-';
  if(coey == 1)
    Coey = '';
  if(coey == -1)
    Coey = '-';

  if(Coex == '0')
    return "${Coey}y = ${Constant}";
  if(Coey == '0')
    return "${Coex}x = ${Constant}";

  return '${Coex}x ${sign} ${Coey}y = ${Constant}';
}

String x_intercept(double l, double angle){
  return formatNumber((l/cos(angle)).toStringAsFixedNoZero(precision));
}

String y_intercept(double l, double angle){
  return formatNumber((l/sin(angle)).toStringAsFixedNoZero(precision));
}

String xAxisAngle(double angle){
  return (toDegree(atan((-(1/tan(angle)))))).toStringAsFixedNoZero(precision) + '°';
}

String yAxisAngle(double angle){
  return (90 - (toDegree(atan((-(1/tan(angle))))))).toStringAsFixedNoZero(precision) + '°';
}