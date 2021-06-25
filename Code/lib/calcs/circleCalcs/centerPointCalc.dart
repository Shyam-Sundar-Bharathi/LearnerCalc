import 'package:dream_calc/calcs/trigCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:extended_math/extended_math.dart';

String circleCenterPointChoice(String H, String K, String X, String Y, int fn){
  if(H == '' || K == '' || X == '' || Y == '')
    return "CHECK INPUT";
  if(H == X && K == Y){
    return "CHECK INPUT";
  }
  double h = double.parse(H);
  double k = double.parse(K);
  double x = double.parse(X);
  double y = double.parse(Y);
  String result = '';
  switch(fn){
    case 0 : result = radius(h, k, x, y);
    break;
    case 1 : result = equation(h, k, x, y);
    break;
  }
  return result;
}

String radius(double h, double k, double x, double y){
  double radius = pow( pow(y-k, 2) + pow(x-h, 2) , 0.5);
  String Radius = radius.toStringAsFixedNoZero(precision);
  return formatNumber(Radius);
}

String equation(double h, double k, double x, double y){
  double coex = -2*h;
  double coey = -2*k;
  double r = pow( pow(y-k, 2) + pow(x-h, 2) , 0.5);
  double constant = pow(h,2) + pow(k,2) - pow(r,2);
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

