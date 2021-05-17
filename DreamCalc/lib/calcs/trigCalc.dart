import 'dart:math';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/genScreen.dart';
import 'package:dream_calc/screens/trigScreen.dart';
import 'package:flutter/material.dart';

const double pi = 3.141592653589793238462643383279502884197169399375105820974944;

double checkRadian(double radians){
  if(radians.toStringAsFixedNoZero(3) == (2*pi).toStringAsFixedNoZero(3)){
    return 2*pi;
  }
  else if(radians.toStringAsFixedNoZero(3) == (3*pi/2).toStringAsFixedNoZero(3)){
    return 3*pi/2;
  }
  else if(radians.toStringAsFixedNoZero(3) == (pi).toStringAsFixedNoZero(3)){
    return pi;
  }
  else if(radians.toStringAsFixedNoZero(3) == (pi/2).toStringAsFixedNoZero(3)){
    return pi/2;
  }
  else
    return radians;
}

double toDegree(double radian){
  return radian*180/pi;
}

double toRadian(double degree){
  return checkRadian(degree*pi/180);
}

List<String> checkForInfinity(List<String> answers) {
  List<int> checkers = [3,5,6];
  for(int i=3; i<=6; i++){
    if(double.parse(answers[i])>100000){
      answers[i] = 'Infinity';
    }
    else if(double.parse(answers[i])<-100000){
      answers[i] = '- Infinity';
    }
  }
  return answers;
}

List<String> trigoCalc(double ui){
  List<String> answers = [' ',' ',' ',' ',' ',' ',' '];
  if(inFocusDegree && ui!=''){
    double radians = toRadian(ui);
    answers[0] = radians.toStringAsFixedNoZero(precision);
    answers[1] = sin(radians).toStringAsFixedNoZero(precision);
    answers[2] = cos(radians).toStringAsFixedNoZero(precision);
    answers[3] = tan(radians).toStringAsFixedNoZero(precision);
    answers[4] = (1/(tan(radians))).toStringAsFixedNoZero(precision);
    answers[5] = (1/(cos(radians))).toStringAsFixedNoZero(precision);
    answers[6] = (1/sin(radians)).toStringAsFixedNoZero(precision);
    answers = checkForInfinity(answers);
  }
  if(!inFocusDegree && ui!=''){

    double radians = ui;
    radians = checkRadian(radians);
    print(radians);
    print(toDegree(radians));
    answers[0] = toDegree(radians).toStringAsFixedNoZero(precision);
    answers[1] = sin(radians).toStringAsFixedNoZero(precision);
    answers[2] = cos(radians).toStringAsFixedNoZero(precision);
    answers[3] = tan(radians).toStringAsFixedNoZero(precision);
    answers[4] = (1/(tan(radians))).toStringAsFixedNoZero(precision);
    answers[5] = (1/(cos(radians))).toStringAsFixedNoZero(precision);
    answers[6] = (1/sin(radians)).toStringAsFixedNoZero(precision);
    answers = checkForInfinity(answers);
  }
  return answers;
}

double Asin(String ui){
  if(ui!=''){
    double radians = asin(double.parse(ui));
    radians = checkRadian(radians);
    return radians;
  }
  return 0;
}

double Acos(String ui){
  if(ui!=''){
    double radians = acos(double.parse(ui));
    radians = checkRadian(radians);
    return radians;
  }
  return 0;
}

double Atan(String ui){
  if(ui!=''){
    double radians = atan(double.parse(ui));
    radians = checkRadian(radians);
    return radians;
  }
  return 0;
}

double Acot(String ui){
  if(ui!=''){
    double radians = pi/2 - atan(double.parse(ui));
    checkRadian(radians);
    return radians;
  }
  return 0;
}


double Asec(String ui){
  if(ui!='' && (double.parse(ui) >=1 || double.parse(ui) <= -1)){
    double radians = acos(1/double.parse(ui));
    return radians;
  }
  return 0;
}

double Acosec(String ui){
  if(ui!='' && (double.parse(ui) >=1 || double.parse(ui) <= -1)){
    double radians = asin(1/double.parse(ui));
    return radians;
  }
  return 0;
}


