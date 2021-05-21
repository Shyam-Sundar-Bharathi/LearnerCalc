import 'dart:math';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:extended_math/extended_math.dart';
import 'package:dream_calc/screens/menu.dart';

String centTend(String userInput, int choice){
  if(userInput == '')
    return ' ';
  if(userInput.endsWith(','))
    userInput = userInput.substring(0,userInput.length-1);
  double result;
  String Mode;
    switch(choice){
      case 0: result = mean(userInput);
      break;
      case 1: result = median(userInput);
      break;
      case 2: Mode = mode(userInput);
      break;
      case 3: result = stddev(userInput);
      break;
      case 4: result = variance(userInput);
      break;
      case 5: result = cv(userInput);
      break;
      case 6: result = range(userInput);
      break;
      case 7: result = gm(userInput);
      break;
      case 8: result = hm(userInput);
      break;

    }
  return choice == 2? Mode : formatNumber(double.parse(result.toStringAsFixedNoZero(precision)));
}


double mean (String userInput) {
  var sArray = userInput.split(",");
  var length = sArray.length;
  List<num> iArray = [];
  for(int iter=0; iter<length; iter++)
    iArray.add(double.parse(sArray[iter]));
  final c = CentralTendency(Vector(iArray));
  return c.arithmetic().toDouble();
}

double median (String userInput) {
  var sArray = userInput.split(",");
  var iArray = [];
  var length = sArray.length;
  var iter = 0;
  for(iter=0; iter<length; iter++)
    iArray.add(double.parse(sArray[iter]));
  iArray.sort();
  var median = 0.0;
  if(length % 2 == 1)
    {
      median = iArray[((length-1)/2).truncate()];
      return median;
    }
  median = (((iArray[((length-1)/2).floor()] + iArray[((length-1)/2).ceil()]))/2);
  return median;
}

String mode (String userInput) {
  var sArray = userInput.split(",");
  var iArray = <num>[];
  var length = sArray.length;
  var iter = 0;
  for(iter=0; iter<length; iter++)
    iArray.add(double.parse(sArray[iter]));
  final c = CentralTendency(Vector(iArray));
  String answer = c.mode().toString();
  answer = answer.substring(1, answer.length - 1);
  sArray = answer.split(',');
  answer = '';
  for(iter=0; iter<sArray.length; iter++){
    answer += double.parse(sArray[iter]).toStringAsFixedNoZero(10) + ', ';
  }
  answer = answer.substring(0, answer.length - 2);
  return answer;
}

double range (String userInput) {
  var sArray = userInput.split(",");
  var iArray = [];
  var length = sArray.length;
  var iter = 0;
  for(iter=0; iter<length; iter++)
    iArray.add(double.parse(sArray[iter]));
  iArray.sort();
  return (iArray[length-1] - iArray[0]);

}

double variance (String userInput){
  var sArray = userInput.split(",");
  var length = sArray.length;
  var iter = 0;
  var result = 0.0;
  var avg = mean(userInput);
  for(iter=0; iter<length; iter++)
    result += pow(avg - double.parse(sArray[iter]), 2);
  result /= length;
  return result;

}

double stddev (String userInput){
  return (pow(variance(userInput),0.5));

}

double cv (String userInput){
  return (stddev(userInput)/(mean(userInput)));
}

double gm(String userInput){
  var sArray = userInput.split(",");
  var length = sArray.length;
  List<num> iArray = [];
  for(int iter=0; iter<length; iter++)
    iArray.add(double.parse(sArray[iter]));
  final c = CentralTendency(Vector(iArray));
  return c.geometric().toDouble();
}

double hm(String userInput){
  var sArray = userInput.split(",");
  var length = sArray.length;
  List<num> iArray = [];
  for(int iter=0; iter<length; iter++)
    iArray.add(double.parse(sArray[iter]));
  final c = CentralTendency(Vector(iArray));
  return c.harmonic().toDouble();
}