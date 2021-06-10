import 'dart:math';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/menu.dart';

String area (String userInput, String dropDownValue) {
  if(userInput == '')
    return "CHECK INPUT";
  double area = 0;

  //SQUARE
  if(dropDownValue == "SQUARE"){
    if(userInput.contains(',')){
      return "CHECK INPUT";
    }
    var a = double.parse(userInput);
    area = a*a;
  }

  //CIRCLE
  else if(dropDownValue == "CIRCLE"){
    if(userInput.contains(',')){
      return "CHECK INPUT";
    }
    var r = double.parse(userInput);
    area = pi*r*r;
  }

  //RECTANGLE
  else if (dropDownValue == "RECTANGLE"){
    var arr = userInput.split(",");
    if(arr.length != 2){
      return "CHECK INPUT";
    }
    var l = double.parse(arr[0]);
    var b = double.parse(arr[1]);
    area = l*b;
  }

  //TRIANGLE
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
      if(area == 0){
        return "IMPOSSIBLE TRIANGLE";
      }
    }
    else{
      return "CHECK INPUT";
    }
  }

  //PARALLELOGRAM
  else if(dropDownValue == "PARALLELOGRAM"){
    var arr = userInput.split(",");
    if(arr.length != 2){
      return "CHECK INPUT";
    }
    var b = double.parse(arr[0]);
    var h = double.parse(arr[1]);
    area = b * h;
  }

  //RHOMBUS
  else if(dropDownValue == "RHOMBUS"){
    var arr = userInput.split(",");
    if(arr.length != 2){
      return "CHECK INPUT";
    }
    area = 0.5 * double.parse(arr[0]) * double.parse(arr[1]);
  }

  //TRAPEZIUM
  else if(dropDownValue == "TRAPEZIUM"){
    var arr = userInput.split(",");
    if(arr.length != 3){
      return "CHECK INPUT";
    }
    area = 0.5 * double.parse(arr[0]) * (double.parse(arr[1]) + double.parse(arr[2]));
  }

  //ELLIPSE
  else if(dropDownValue == "ELLIPSE"){
    var arr = userInput.split(",");
    if(arr.length != 2){
      return "CHECK INPUT";
    }
    var a = double.parse(arr[0]);
    var b = double.parse(arr[1]);
    area = pi * a * b;
  }

  //CUBE
  else if(dropDownValue == "CUBE"){
    if(userInput.contains(',')){
      return "CHECK INPUT";
    }
    var a = double.parse(userInput);
    area = 6*a*a;
  }

  //SPHERE
  else if(dropDownValue == "SPHERE"){
    if(userInput.contains(',')){
      return "CHECK INPUT";
    }
    var r = double.parse(userInput);
    area = 4*pi*pow(r,2);
  }

  //CUBOID
  else if (dropDownValue == "CUBOID"){
    var arr = userInput.split(",");
    if(arr.length != 3){
      return "CHECK INPUT";
    }
    var l = double.parse(arr[0]);
    var b = double.parse(arr[1]);
    var h = double.parse(arr[2]);
    area = 2*(l*b + b*h + l*h);
  }

  //CYLINDER
  else if (dropDownValue == "CYLINDER"){
    var arr = userInput.split(",");
    if(arr.length != 2){
      return "CHECK INPUT";
    }
    var r = double.parse(arr[0]);
    var h = double.parse(arr[1]);
    area = 2*pi*r*(r+h);
  }

  //CONE
  else if(dropDownValue == "CONE"){
    var arr = userInput.split(",");
    if(arr.length != 2){
      return "CHECK INPUT";
    }
    var r = double.parse(arr[0]);
    var l = double.parse(arr[1]);
    area = pi*r*(r+l);
  }

  //HEMISPHERE
  else if(dropDownValue == "HEMISPHERE"){
    if(userInput.contains(',')){
      return "CHECK INPUT";
    }
    var r = double.parse(userInput);
    area = 3*pi*pow(r,2);
  }

  return formatNumber(area.toStringAsFixedNoZero(precision));
}