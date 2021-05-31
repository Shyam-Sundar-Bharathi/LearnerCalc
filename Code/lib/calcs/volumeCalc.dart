import 'dart:math';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/menu.dart';

String volume (String userInput, String dropDownValue) {
  if(userInput == '')
    return 'CHECK INPUT';
  double volume = 0;
  const pi = 3.141592653589793238;
  if(dropDownValue == "CUBE"){
    var side = double.parse(userInput);
    volume = side*side*side;
  }
  else if(dropDownValue == "SPHERE"){
    volume = 4*pi*pow(double.parse(userInput),3)/3;
  }
  else if (dropDownValue == "CUBOID"){
    var arr = userInput.split(",");
    volume = double.parse(arr[0])*double.parse(arr[1])*double.parse(arr[2]);
  }
  else if (dropDownValue == "CYLINDER"){
    var arr = userInput.split(",");
    volume = pi*pow((double.parse(arr[0])),2)*double.parse(arr[1]);
  }
  else if(dropDownValue == "CONE"){
    var arr = userInput.split(",");
    volume = (1/3)*pi*pow(double.parse(arr[0]),2)*double.parse(arr[1]);
  }
  else if(dropDownValue == "HEMISPHERE"){
    volume = 2*pi*pow(double.parse(userInput),3)/3;
  }
  else if(dropDownValue == "TETRAHEDRON"){
    volume = pow(double.parse(userInput),3)/(6*1.41421356);
  }
  return formatNumber(volume.toStringAsFixedNoZero(precision));

}