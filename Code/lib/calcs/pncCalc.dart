import 'dart:math';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/formatNumber.dart';

double fact(double n){
  if(n == 1 || n == 0) return 1;
  return n * fact(n-1);
}

String pncChoice(String N, String R, int fn){
  bool flag = false;
  if(fn == 4 && N == '')
    return "CHECK INPUT";
  if(fn == 5 && R == '')
    return "CHECK INPUT";
  if(N == '' || R == ''){
    if(fn == 4){ if(N == '') flag = true; else R = '0';}
    else if(fn == 5){ if(R == '') flag = true; else N = '0';}
    else flag = true;
  }
  if(flag) return "CHECK INPUT";
  double n = double.parse(N);
  double r = double.parse(R);
  if(r > n)
    return "CHECK INPUT";
  double result = 0;
  switch(fn){
    case 0: result = permutationWithRepetition(n, r);
    break;
    case 1: result = permutationWithoutRepetition(n, r);
    break;
    case 2: result = combinationWithRepetition(n, r);
    break;
    case 3: result = combinationWithoutRepetition(n, r);
    break;
    case 4: result = fact(n);
    break;
    case 5: result = fact(r);
    break;
    case 6: result = fact(n-r);
  }
  return formatNumber(result.toStringAsFixedNoZero(precision));
}

double permutationWithRepetition(double n, double r){
  return pow(n, r).toDouble();
}

double permutationWithoutRepetition(double n, double r){
  return fact(n)/fact(n-r);
}

double combinationWithRepetition(double n, double r){
  return fact(n+r-1)/(fact(r) * fact(n-1));
}

double combinationWithoutRepetition(double n, double r){
  return fact(n)/(fact(r) * fact(n-r));
}




