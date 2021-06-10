import 'dart:math';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/menu.dart';

String volume (String userInput, String dropDownValue) {
  if(userInput == '')
    return 'CHECK INPUT';
  double volume = 0;
  const pi = 3.141592653589793238;

  //CUBE
  if(dropDownValue == "CUBE"){
    if(userInput.contains(',')){
      return "CHECK INPUT";
    }
    var side = double.parse(userInput);
    volume = side*side*side;
  }

  //SPHERE
  else if(dropDownValue == "SPHERE"){
    if(userInput.contains(',')){
      return "CHECK INPUT";
    }
    volume = 4*pi*pow(double.parse(userInput),3)/3;
  }

  //CUBOID
  else if (dropDownValue == "CUBOID"){
    var arr = userInput.split(",");
    if(arr.length != 3){
      return "CHECK INPUT";
    }
    volume = double.parse(arr[0])*double.parse(arr[1])*double.parse(arr[2]);
  }

  //CYLINDER
  else if (dropDownValue == "CYLINDER"){
    var arr = userInput.split(",");
    if(arr.length != 2){
      return "CHECK INPUT";
    }
    volume = pi*pow((double.parse(arr[0])),2)*double.parse(arr[1]);
  }

  //CONE
  else if(dropDownValue == "CONE"){
    var arr = userInput.split(",");
    if(arr.length != 2){
      return "CHECK INPUT";
    }
    volume = (1/3)*pi*pow(double.parse(arr[0]),2)*double.parse(arr[1]);
  }

  //HEMISPHERE
  else if(dropDownValue == "HEMISPHERE"){
    if(userInput.contains(',')){
      return "CHECK INPUT";
    }
    volume = 2*pi*pow(double.parse(userInput),3)/3;
  }

  //TETRAHEDRON
  else if(dropDownValue == "TETRAHEDRON"){
    if(userInput.contains(',')){
      return "CHECK INPUT";
    }
    volume = pow(double.parse(userInput),3)/(6*1.41421356);
  }

  return formatNumber(volume.toStringAsFixedNoZero(precision));

}