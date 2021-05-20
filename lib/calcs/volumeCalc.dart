import 'dart:math';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/genScreen.dart';

String volume (String userInput, String dropDownValue) {
  if(userInput == '')
    return '0';
  String volume = '';
  const pi = 3.141592653589793238;
  if(dropDownValue == "CUBE"){
    var side = double.parse(userInput);
    volume = (side*side*side).toStringAsFixedNoZero(precision);
  }
  else if(dropDownValue == "SPHERE"){
    volume = (4*pi*pow(double.parse(userInput),3)/3).toStringAsFixedNoZero(precision);
  }
  else if (dropDownValue == "CUBOID"){
    var arr = userInput.split(",");
    volume = (double.parse(arr[0])*double.parse(arr[1])*double.parse(arr[2])).toStringAsFixedNoZero(precision);
  }
  else if (dropDownValue == "CYLINDER"){
    var arr = userInput.split(",");
    volume = (pi*pow((double.parse(arr[0])),2)*double.parse(arr[1])).toStringAsFixedNoZero(precision);
  }
  else if(dropDownValue == "CONE"){
    var arr = userInput.split(",");
    volume = ((1/3)*pi*pow(double.parse(arr[0]),2)*double.parse(arr[1])).toStringAsFixedNoZero(precision);
  }

  return formatNumber(double.parse(volume));

}