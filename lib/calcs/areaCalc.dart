import 'dart:math';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/menu.dart';

String area (String userInput, String dropDownValue) {
  if(userInput == '')
    return " ";
  double area = 0;
  if(dropDownValue == "SQUARE"){
    var a = double.parse(userInput);
    area = a*a;
  }
  else if(dropDownValue == "CIRCLE"){
    var r = double.parse(userInput);
    area = pi*r*r;
  }
  else if (dropDownValue == "RECTANGLE"){
    var arr = userInput.split(",");
    var l = double.parse(arr[0]);
    var b = double.parse(arr[1]);
    area = l*b;
  }
  else if (dropDownValue == "TRIANGLE"){
    var arr = userInput.split(",");
    if (arr.length == 2){
      var b = double.parse(arr[0]);
      var h = double.parse(arr[1]);
      area = 0.5 * b * h;
    }
    else if(arr.length == 3){
      var a = double.parse(arr[0]);
      var b = double.parse(arr[1]);
      var c = double.parse(arr[2]);
      var s = (a+b+c)/2;
      area = pow(s*(s-a)*(s-b)*(s-c),0.5);
    }
  }

  else if(dropDownValue == "PARALLELOGRAM"){
    var arr = userInput.split(",");
    var b = double.parse(arr[0]);
    var h = double.parse(arr[1]);
    area = b * h;
  }

  else if(dropDownValue == "RHOMBUS"){
    var arr = userInput.split(",");
    area = 0.5 * double.parse(arr[0]) * double.parse(arr[1]);
  }

  else if(dropDownValue == "TRAPEZIUM"){
    var arr = userInput.split(",");
    area = 0.5 * double.parse(arr[0]) * (double.parse(arr[1]) + double.parse(arr[2]));
  }

  else if(dropDownValue == "ELLIPSE"){
    var arr = userInput.split(",");
    var a = double.parse(arr[0]);
    var b = double.parse(arr[1]);
    area = pi * a * b;
  }

  else if(dropDownValue == "CUBE"){
    var a = double.parse(userInput);
    area = 6*a*a;
  }
  else if(dropDownValue == "SPHERE"){
    var r = double.parse(userInput);
    area = 4*pi*pow(r,2);
  }
  else if (dropDownValue == "CUBOID"){
    var arr = userInput.split(",");
    var l = double.parse(arr[0]);
    var b = double.parse(arr[1]);
    var h = double.parse(arr[2]);
    area = 2*(l*b + b*h + l*h);
  }
  else if (dropDownValue == "CYLINDER"){
    var arr = userInput.split(",");
    var r = double.parse(arr[0]);
    var h = double.parse(arr[1]);
    area = 2*pi*r*(r+h);
  }
  else if(dropDownValue == "CONE"){
    var arr = userInput.split(",");
    var r = double.parse(arr[0]);
    var l = double.parse(arr[1]);
    area = pi*r*(r+l);
  }

  else if(dropDownValue == "HEMISPHERE"){
    var r = double.parse(userInput);
    area = 3*pi*pow(r,2);
  }
  return formatNumber(area.toStringAsFixedNoZero(precision));
}