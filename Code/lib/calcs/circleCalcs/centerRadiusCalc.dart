import 'dart:math';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/formatNumber.dart';


String cirlceCenterRadiusChoice(String X, String Y, String R, int fn){
  if(X == '' || Y == '' || R == '')
    return "CHECK INPUT";
  double x = double.parse(X);
  double y = double.parse(Y);
  double r = double.parse(R);
  String result = '';
  switch(fn){
    case 0: result = equation(x, y, r);
    break;
  }
  return result;
}

String equation(double x, double y, double r){
  double coex = -2*x;
  double coey = -2*y;
  double constant = pow(x,2) + pow(y,2) - pow(r,2);
  String Coex = coex.toStringAsFixedNoZero(precision);
  String Coey = coey.toStringAsFixedNoZero(precision);
  String Constant = constant.toStringAsFixedNoZero(precision);
  List<String> signs = ['','',''];
  signs[0] = coex >= 0 ? '+' : '';
  signs[1] = coey >= 0 ? '+' : '';
  signs[2] = constant >= 0 ? '+' : '';
  String xTerm = signs[0] + Coex + 'x';
  String yTerm = signs[1] + Coey + 'y';
  String constantTerm = signs[2] + Constant;
  if(coex == 0)
    xTerm = '';
  if(coey == 0)
    yTerm = '';
  if(constant == 0)
    constantTerm = '';
  return "x^2 + y^2 ${xTerm} ${yTerm} ${constantTerm} = 0";
}

