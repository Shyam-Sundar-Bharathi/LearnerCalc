import 'dart:math';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:extended_math/extended_math.dart';
import 'package:dream_calc/screens/menu.dart';

String centTendChoice(String userInput, int choice){
  if(userInput == '' || userInput.split(',').length == 1)
    return "CHECK INPUT";
  if(userInput.endsWith(','))
    return "CHECK INPUT";
  double result;
  String Mode;
    switch(choice){
      case 0: result = mean(userInput);
      break;
      case 1: result = median(userInput);
      break;
      case 2: Mode = mode(userInput);
      break;
      case 3: result = samStdDev(userInput);
      break;
      case 4: result = samVariance(userInput);
      break;
      case 5: result = cv(userInput);
      break;
      case 6: result = range(userInput);
      break;
      case 7: result = gm(userInput);
      break;
      case 8: result = hm(userInput);
      break;
      case 9: result = popVariance(userInput);
      break;
      case 10 : result = popStdDev(userInput);
      break;
      case 11 : result = countElements(userInput);

    }
  return ((choice == 7 || choice == 8) && result == -1) ? "INPUT CAN'T CONTAIN 0" :
          choice == 2? Mode :
          formatNumber(result.toStringAsFixedNoZero(precision));
}


double mean (String userInput) {
  var sArray = userInput.split(",");
  var length = sArray.length;
  List<num> iArray = [];
  for(int iter=0; iter<length; iter++)
    iArray.add(double.parse(sArray[iter]));
  // final c = CentralTendency(Vector(iArray));
  double sum = iArray.fold(0, (p, c) => p + c);
  return sum/length;
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

double popVariance (String userInput){
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

double samVariance (String userInput){
  var sArray = userInput.split(",");
  var length = sArray.length;
  var iter = 0;
  var result = 0.0;
  var avg = mean(userInput);
  for(iter=0; iter<length; iter++)
    result += pow(avg - double.parse(sArray[iter]), 2);
  result /= (length-1);
  return result;

}

double samStdDev (String userInput){
  return (pow(samVariance(userInput),0.5));
}

double popStdDev (String userInput){
  return (pow(popVariance(userInput),0.5));
}

double cv (String userInput){
  return (samStdDev(userInput)/(mean(userInput)));
}

double gm(String userInput){
  var sArray = userInput.split(",");
  var length = sArray.length;
  if (sArray.contains('0')){
    return -1;
  }
  List<num> iArray = [];
  for(int iter=0; iter<length; iter++)
    iArray.add(double.parse(sArray[iter]));
  final c = CentralTendency(Vector(iArray));
  return c.geometric().toDouble();
}

double hm(String userInput){
  var sArray = userInput.split(",");
  var length = sArray.length;
  if (sArray.contains('0')){
    return -1;
  }
  List<num> iArray = [];
  for(int iter=0; iter<length; iter++)
    iArray.add(double.parse(sArray[iter]));
  final c = CentralTendency(Vector(iArray));
  return c.harmonic().toDouble();
}

double countElements(String userInput){
  var sArray = userInput.split(",");
  return sArray.length.toDouble();
}