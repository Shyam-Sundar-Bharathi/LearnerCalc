import 'dart:math';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/genScreen.dart';

String area (String userInput, String dropDownValue) {
  if(userInput == '')
    return '0';
  String area;
  if(dropDownValue == "SQUARE"){
    var side = double.parse(userInput);
    area = (side*side).toStringAsFixedNoZero(precision);
  }
  else if(dropDownValue == "CIRCLE"){
    area = (3.141592653589793238*double.parse(userInput)*double.parse(userInput)).toStringAsFixedNoZero(precision);
  }
  else if (dropDownValue == "RECTANGLE"){
    var arr = userInput.split(",");
    area = (double.parse(arr[0])*double.parse(arr[1])).toStringAsFixedNoZero(precision);
  }
  else if (dropDownValue == "TRIANGLE"){
    var arr = userInput.split(",");
    if (arr.length == 2){
      area = (0.5 * double.parse(arr[0]) * double.parse(arr[1])).toStringAsFixedNoZero(precision);
    }
    else if(arr.length == 3){
      var a = double.parse(arr[0]);
      var b = double.parse(arr[1]);
      var c = double.parse(arr[2]);
      var s = (a+b+c)/2;
      area = pow(s*(s-a)*(s-b)*(s-c),0.5).toStringAsFixed(precision);
    }
  }

  else if(dropDownValue == "PARALLELOGRAM"){
    var arr = userInput.split(",");
    area = (double.parse(arr[0]) * double.parse(arr[1])).toStringAsFixedNoZero(precision);
  }

  else if(dropDownValue == "RHOMBUS"){
    var arr = userInput.split(",");
    area = (0.5 * double.parse(arr[0]) * double.parse(arr[1])).toStringAsFixedNoZero(precision);
  }
  return formatNumber(double.parse(area));
}